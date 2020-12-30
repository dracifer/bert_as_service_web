from django.shortcuts import render
from bert_serving.client import BertClient
from .forms import ComputeSimForm, AnswerForm
from math import sqrt
import numpy as np

INDEX_TEMPLATE_PATH = 'compute_sim/index.html'

def _cos_sim(vec1, vec2):
  assert len(vec1) == len(vec2)
  norm = np.linalg.norm(vec1) * np.linalg.norm(vec2)
  result = np.dot(vec1, vec2)
  if norm > 0:
    return result / norm
  return None

def index(request):
  q_form = ComputeSimForm()
  return render(request, INDEX_TEMPLATE_PATH, {'q_form': q_form})


def compute(request):
  result = None
  a_form = None
  q_form = ComputeSimForm()
  if request.method == 'GET':
    q_form = ComputeSimForm(request.GET)
    if q_form.is_valid():
      bc = BertClient()
      embeddings = bc.encode([q_form.cleaned_data["text1"], q_form.cleaned_data["text2"]])
      assert len(embeddings) == 2
      a_form = AnswerForm(initial={'embedding1': embeddings[0].tolist(), 'embedding2': embeddings[1].tolist()})
      result = _cos_sim(embeddings[0], embeddings[1])
      if result:
        a_form.fields['result'].initial = result

  print(result)
  return render(request, INDEX_TEMPLATE_PATH, {'q_form': q_form, 'a_form': a_form})
