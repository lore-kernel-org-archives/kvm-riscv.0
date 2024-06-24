From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Date: Mon, 24 Jun 2024 19:21:32 +0000
Subject: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
In-Reply-To: <ZnmRgqD6FmXNNzzI@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
 <504fa0a7264d4762afda2f13c3525ce5@huawei.com> <ZnmRgqD6FmXNNzzI@google.com>
Message-ID: <ec1e168193ed45dea22117606cabacc5@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Sean Christopherson <seanjc@google.com>
> Sent: Monday, June 24, 2024 4:32 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>; Will Deacon
> <will@kernel.org>; Marc Zyngier <maz@kernel.org>; Oliver Upton
> <oliver.upton@linux.dev>; Huacai Chen <chenhuacai@kernel.org>; Michael
> Ellerman <mpe@ellerman.id.au>; Anup Patel <anup@brainfault.org>; Paul
> Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Heiko
> Carstens <hca@linux.ibm.com>; Vasily Gorbik <gor@linux.ibm.com>;
> Alexander Gordeev <agordeev@linux.ibm.com>; Christian Borntraeger
> <borntraeger@linux.ibm.com>; Janosch Frank <frankja@linux.ibm.com>;
> Claudio Imbrenda <imbrenda@linux.ibm.com>; Thomas Gleixner
> <tglx@linutronix.de>; Ingo Molnar <mingo@redhat.com>; Borislav Petkov
> <bp@alien8.de>; Dave Hansen <dave.hansen@linux.intel.com>;
> x86 at kernel.org; Peter Zijlstra <peterz@infradead.org>; Arnaldo Carvalho de
> Melo <acme@kernel.org>; Paolo Bonzini <pbonzini@redhat.com>; Tony
> Krowiak <akrowiak@linux.ibm.com>; Halil Pasic <pasic@linux.ibm.com>;
> Jason Herne <jjherne@linux.ibm.com>; Harald Freudenberger
> <freude@linux.ibm.com>; Alex Williamson <alex.williamson@redhat.com>;
> Andy Lutomirski <luto@kernel.org>; linux-arm-kernel at lists.infradead.org;
> kvmarm at lists.linux.dev; linux-mips at vger.kernel.org; kvm at vger.kernel.org;
> linuxppc-dev at lists.ozlabs.org; kvm-riscv at lists.infradead.org; linux-
> riscv at lists.infradead.org; linux-s390 at vger.kernel.org; linux-
> kernel at vger.kernel.org; linux-perf-users at vger.kernel.org; Anish Ghulati
> <aghulati@google.com>; Venkatesh Srinivas <venkateshs@chromium.org>;
> Andrew Thornton <andrewth@google.com>
> Subject: Re: [PATCH 00/26] KVM: vfio: Hide KVM internals from others
> 
> On Thu, Jun 20, 2024, Shameerali Kolothum Thodi wrote:
> > > This is a borderline RFC series to hide KVM's internals from the rest of
> > > the kernel, where "internals" means data structures, enums, #defines,
> > > APIs, etc. that are intended to be KVM-only, but are exposed
> everywhere
> > > due to kvm_host.h (and other headers) living in the global include paths.
> >
> > Hi Sean,
> >
> > Just thought of checking with you on this series. Do you have plans to
> revive this
> > series?
> 
> Yep!
> 
> > The reason I am asking is, on ARM64/KVM side we do have a requirement
> > to share the KVM VMID with SMMUV3. Please see the RFC I sent out
> earlier this
> > year[1]. The series basically provides a way for KVM to pin a VMID and also
> > associates an iommufd ctx with a struct kvm * to retrieve that VMID.
> >
> > As mentioned above, some of the patches in this series(especially 1-4 & 6)
> that
> > does the VFIO cleanups and dropping CONFIG_KVM_VFIO looks very
> straightforward
> > and useful. I am thinking of including those when I re-spin my RFC series, if
> > that?s ok.
> 
> Please don't include them, as the patch they build towards (patch 5) is
> buggy[*],
> and I am fairly certain that at least some of the patches will change
> significantly.

Ok. Got it. Thanks for taking a look at the KVM pinned VMID series and comments
there.

Shameer
