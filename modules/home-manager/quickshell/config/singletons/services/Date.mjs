const getTime = (date) => {
  const locale = Qt.Locale();
  date.toLocaleTimeString(locale);
};
