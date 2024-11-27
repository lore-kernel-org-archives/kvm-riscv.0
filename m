From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Nov 2024 17:59:52 +0100
Subject: [GIT PULL] KVM/riscv changes for 6.13, part #2
In-Reply-To: <CAAhSdy1QCeg82kQsPHJx1+Oc=L7BoOUTpeLUNoeApao8rZDE+Q@mail.gmail.com>
References: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
 <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com>
 <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com>
 <CABgObfbKYc0Dqcq36dHsV=uopV+TAGu9-SuZF+QP=u6x0uMiHg@mail.gmail.com> <CAAhSdy1QCeg82kQsPHJx1+Oc=L7BoOUTpeLUNoeApao8rZDE+Q@mail.gmail.com>
Message-ID: <CABgObfZ1iqNGqb+MW84_tgZEnSoAjMqzXFcoq0s58iTZDPMKgg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2024 at 5:51?PM Anup Patel <anup@brainfault.org> wrote:
> > Ok, will do. But I'd like to understand if KVM patches needed the bare
> > metal support. If not, and the only reason to skip it in 6.12 was the
> > hwcap.h constants, then there was no reason to delay it. Just send the
> > hwcap.h update as a pull request to both me and Palmer, and we'll
> > merge it from the same commit into our trees.
>
> It was skipped in 6.12 due to confusion between myself and Palmer
> about which tree these patches will go through and we did not resolve
> this in time.

I still don't understand if KVM patches need any bare metal code though. :)

It's also unclear to me why "RISC-V: KVM: Allow Smnpm and Ssnpm
extensions for guests" came through the RISC-V tree, thus causing
conflicts in the KVM_RISCV_ISA_EXT_ID enum.  It doesn't seem to need
bare metal support, so it should have come through your tree.

This split between patches that you send to me and those that others
send to someone else is not your fault but it's a mess, and the RISC-V
maintainers should not have gone for the least-work option. If
anything has a bare metal and a KVM part it's totally okay that you
send it to me as a separate pull request, but the right way to do it
is to *include a topic branch from the RISC-V tree* and base the KVM
changes on top. Not to let Linus and myself sort out the conflicts.

Paolo


