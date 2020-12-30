from django import forms

class ComputeSimForm(forms.Form):
    text1 = forms.CharField(label='Text 1', label_suffix=":", max_length=200)
    text2 = forms.CharField(label='Text 2', label_suffix=":", max_length=200)

class AnswerForm(forms.Form):
    result = forms.FloatField(
        label='Similairty',
        label_suffix=":",
        widget=forms.TextInput(attrs={'readonly':'readonly'}),
    )

    embedding1 = forms.JSONField(
        label='Embedding 1',
        label_suffix=":",
        widget=forms.Textarea(
            attrs={
                'readonly':'readonly',
            },
        ),
    )
    embedding2 = forms.JSONField(
        label='Embedding 2',
        label_suffix=":",
        widget=forms.Textarea(
            attrs={
                'readonly':'readonly',
            },
        ),
    )
