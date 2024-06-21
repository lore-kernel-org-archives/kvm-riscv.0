From: Conor Dooley <conor@kernel.org>
Date: Fri, 21 Jun 2024 15:58:18 +0100
Subject: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <20240621-a56e848050ebbf1f7394e51f@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr>
 <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr>
 <20240621-9bf9365533a2f8f97cbf1f5e@orel>
 <20240621-glutton-platonic-2ec41021b81b@spud>
 <20240621-a56e848050ebbf1f7394e51f@orel>
Message-ID: <20240621-surging-flounder-58a653747e1d@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 21, 2024 at 04:52:09PM +0200, Andrew Jones wrote:
> On Fri, Jun 21, 2024 at 03:04:47PM GMT, Conor Dooley wrote:
> > On Fri, Jun 21, 2024 at 03:15:10PM +0200, Andrew Jones wrote:
> > > On Fri, Jun 21, 2024 at 02:42:15PM GMT, Alexandre Ghiti wrote:

> > > I understand the concern; old SBI implementations will leave svadu in the
> > > DT but not actually enable it. Then, since svade may not be in the DT if
> > > the platform doesn't support it or it was left out on purpose, Linux will
> > > only see svadu and get unexpected exceptions. This is something we could
> > > force easily with QEMU and an SBI implementation which doesn't do anything
> > > for svadu. I hope vendors of real platforms, which typically provide their
> > > own firmware and DTs, would get this right, though, especially since Linux
> > > should fail fast in their testing when they get it wrong.
> > 
> > I'll admit, I wasn't really thinking here about something like QEMU that
> > puts extensions into the dtb before their exact meanings are decided
> > upon. I almost only ever think about "real" systems, and in those cases
> > I would expect that if you can update the representation of the hardware
> > provided to (or by the firmware to Linux) with new properties, then updating
> > the firmware itself should be possible.
> > 
> > Does QEMU have the this exact problem at the moment? I know it puts
> > Svadu in the max cpu, but does it enable the behaviour by default, even
> > without the SBI implementation asking for it?
> 
> Yes, because QEMU has done hardware A/D updating since it first started
> supporting riscv, which means it did svadu when neither svadu nor svade
> were in the DT. The "fix" for that was to ensure we have svadu and !svade
> by default, which means we've perfectly realized Alexandre's concern...
> We should be able to change the named cpu types that don't support svadu
> to only have svade in their DTs, since that would actually be fixing those
> cpu types, but we'll need to discuss how to proceed with the generic cpu
> types like 'max'.

Correct me please, since I think I am misunderstanding: At the moment
QEMU does A/D updating whether or not the SBI implantation asks for it,
with the max CPU. The SBI implementation doesn't understand Svadu and
won't strip it. The kernel will get a DT with Svadu in it, but Svadu will
be enabled, so it is not a problem.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240621/3a5e74d8/attachment.sig>
