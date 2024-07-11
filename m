From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu, 11 Jul 2024 18:34:49 +0800
Subject: [PATCH v6 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
In-Reply-To: <20240630-caboose-diameter-7e73bf86da49@spud>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
 <20240628093711.11716-3-yongxuan.wang@sifive.com> <20240628-clamp-vineyard-c7cdd40a6d50@spud>
 <402C3422-0248-4C0F-991E-C0C4BBB0FA72@jrtc27.com> <20240630-caboose-diameter-7e73bf86da49@spud>
Message-ID: <CAMWQL2gpg-xN5xjshTaZT5844kKoZHDmLUQb8nXYYzw1RGbykQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Conor and Jessica,

On Sun, Jun 30, 2024 at 10:09?PM Conor Dooley <conor@kernel.org> wrote:
>
> On Sat, Jun 29, 2024 at 02:09:34PM +0100, Jessica Clarke wrote:
> > On 28 Jun 2024, at 17:19, Conor Dooley <conor@kernel.org> wrote:
> > >
> > > On Fri, Jun 28, 2024 at 05:37:06PM +0800, Yong-Xuan Wang wrote:
> > >> Add entries for the Svade and Svadu extensions to the riscv,isa-extensions
> > >> property.
> > >>
> > >> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > >> ---
> > >> .../devicetree/bindings/riscv/extensions.yaml | 28 +++++++++++++++++++
> > >> 1 file changed, 28 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > >> index 468c646247aa..c3d053ce7783 100644
> > >> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > >> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > >> @@ -153,6 +153,34 @@ properties:
> > >>             ratified at commit 3f9ed34 ("Add ability to manually trigger
> > >>             workflow. (#2)") of riscv-time-compare.
> > >>
> > >> +        - const: svade
> > >> +          description: |
> > >> +            The standard Svade supervisor-level extension for SW-managed PTE A/D
> > >> +            bit updates as ratified in the 20240213 version of the privileged
> > >> +            ISA specification.
> > >> +
> > >> +            Both Svade and Svadu extensions control the hardware behavior when
> > >> +            the PTE A/D bits need to be set. The default behavior for the four
> > >> +            possible combinations of these extensions in the device tree are:
> > >> +            1) Neither Svade nor Svadu present in DT =>
> > >
> > >>                It is technically
> > >> +               unknown whether the platform uses Svade or Svadu. Supervisor may
> > >> +               assume Svade to be present and enabled or it can discover based
> > >> +               on mvendorid, marchid, and mimpid.
> > >
> > > I would just write "for backwards compatibility, if neither Svade nor
> > > Svadu appear in the devicetree the supervisor may assume Svade to be
> > > present and enabled". If there are systems that this behaviour causes
> > > problems for, we can deal with them iff they appear. I don't think
> > > looking at m*id would be sufficient here anyway, since the firmware can
> > > have an impact. I'd just drop that part entirely.
> >
> > Older QEMU falls into that category, as do Bluespec?s soft-cores (which
> > ours are derived from at Cambridge). I feel that, in reality, one
> > should be prepared to handle both trapping and atomic updates if
> > writing an OS that aims to support case 1.
>
> I guess that is actually what we should put in then, to use an
> approximation of your wording, something like
>         Neither Svade nor Svadu present in DT => Supervisor software should be
>         prepared to handle either hardware updating of the PTE A/D bits or page
>         faults when they need updated
> ?

Thank you! I will update in the next version.

Regards,
Yong-Xuan

