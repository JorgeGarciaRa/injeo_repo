import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cafecito_v1/features/shared/shared.dart';

class TerminosScreen extends StatelessWidget {
  const TerminosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: GeometricalBackground(
              child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            // Icon Banner
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (!context.canPop()) return;
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back_rounded,
                        size: 40, color: Colors.white)),
                const Spacer(flex: 1),
                Column(
                  children: [
                    Logo(),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),

            const SizedBox(height: 30),

            Container(
              height: size.height - 260, // 80 los dos sizebox y 100 el ícono
              width: double.infinity,
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: const _RegisterForm(),
            )
          ],
        ),
      ))),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Text('Términos y condiciones', style: textStyles.titleMedium),
          const SizedBox(height: 50),
          const Text(
              'Mihi duco adfero, puer pasco homo aduro missa. Tametsi esse pia illa, renuo uter. Premo picea. Loci letum demum abbas ceterum puteus suus metuo. Suus autus abeo queso > putus faenum. Corrigo lenio. Illa quris aurum sequi utrum taceo, pyropus quantum. Frequentatio immineo lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.'),
          SizedBox(
            height: 10,
          ),
          const Text(
              'Lorem ipsum, aurum haec dimitto. Consurgo cibo duo crux damno caput eximietate passim pello. He malus longe. Civis detineo sic'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿Ya tienes cuenta?'),
              TextButton(
                  onPressed: () {
                    if (context.canPop()) {
                      return context.pop();
                    }
                    context.go('/login');
                  },
                  child: const Text('Ingresa aquí')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('¿No tienes cuenta?'),
              TextButton(
                  onPressed: () => context.push('/register'),
                  child: const Text('Crea una aquí'))
            ],
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
