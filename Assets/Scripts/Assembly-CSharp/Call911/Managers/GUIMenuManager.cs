using Call911.General;
using UnityEngine;
using UnityEngine.UI;

namespace Call911.Managers
{
	public class GUIMenuManager : Singleton<GUIMenuManager>
	{
		[SerializeField]
		public Transform citiesList;
		public Button careerButton;
		public Button freeGameButton;
		public Button continueButton;
		public Button creditsButton;
		public GameObject careerWindow;
		public GameObject freeGameWindow;
		public GameObject backgroundWindow;
		public GameObject creditsWindow;
		public GameObject careerModeWindow;
		public Text continueButtonText;
		public CityWindow cityWindow;
		public OptionsWindow options;
		public ScrollRect creditsContainer;
	}
}
