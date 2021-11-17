From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Nov 2021 10:49:08 +0530
Subject: [PATCH 3/4] Documentation: update vcpu-requests.rst reference
In-Reply-To: <8a762a6b-4ad8-211f-f350-ba65f8e77b64@redhat.com>
References: <cover.1637064577.git.mchehab+huawei@kernel.org>
 <32b3693314f3914f10a42dea97ad6e06292fcd4a.1637064577.git.mchehab+huawei@kernel.org>
 <34e691ec-a58d-c86b-a2ef-6fa4f0385b69@redhat.com>
 <CAAhSdy0JRTwmr+EdSEr3ng1gfDpqnF7m3ejC2AydjAgu0mEQLw@mail.gmail.com>
 <8a762a6b-4ad8-211f-f350-ba65f8e77b64@redhat.com>
Message-ID: <CAAhSdy1ZijNE-JDj62KU1GbNjxu4UQQbpuz4P0wK+1orOyBMKA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 16, 2021 at 11:35 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/16/21 15:01, Anup Patel wrote:
> > On Tue, Nov 16, 2021 at 6:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> On 11/16/21 13:11, Mauro Carvalho Chehab wrote:
> >>> Changeset 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> >>> renamed: Documentation/virtual/kvm/vcpu-requests.rst
> >>> to: Documentation/virt/kvm/vcpu-requests.rst.
> >>>
> >>> Update its cross-reference accordingly.
> >>>
> >>> Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> >>> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> >>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>> ---
> >>>
> >>> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> >>> See [PATCH 0/4] at: https://lore.kernel.org/all/cover.1637064577.git.mchehab+huawei at kernel.org/
> >>>
> >>>    arch/riscv/kvm/vcpu.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> >>> index e3d3aed46184..fb84619df012 100644
> >>> --- a/arch/riscv/kvm/vcpu.c
> >>> +++ b/arch/riscv/kvm/vcpu.c
> >>> @@ -740,7 +740,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >>>                 * Ensure we set mode to IN_GUEST_MODE after we disable
> >>>                 * interrupts and before the final VCPU requests check.
> >>>                 * See the comment in kvm_vcpu_exiting_guest_mode() and
> >>> -              * Documentation/virtual/kvm/vcpu-requests.rst
> >>> +              * Documentation/virt/kvm/vcpu-requests.rst
> >>>                 */
> >>>                vcpu->mode = IN_GUEST_MODE;
> >>>
> >>>
> >>
> >> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > Thanks Paolo, let me know if you want me to include this patch
> > as part of the fixes I have collected.
>
> I think Mauro will handle it, but you can pick it as well.

Okay, I will let Mauro handle it.

Thanks,
Anup

>
> Paolo
>

