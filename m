From: Fuad Tabba <tabba@google.com>
Date: Tue, 6 Aug 2024 09:24:43 +0100
Subject: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
In-Reply-To: <ZrFfgzRbiqT-Zi2O@linux.dev>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev>
Message-ID: <CA+EHjTxZwDOeC94Y1otxcp-mcwUZA=TpQp4pav-E8Xvb2MA64Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Oliver,

On Tue, 6 Aug 2024 at 00:26, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> [+cc Fuad]
>
> Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> the page as dirty out of the critical section") that restructuring
> around the MMU lock was helpful for reuse (presumably for pKVM), but I
> lack the context there.

That was for some refactoring I'd done later on for mem_aborts in
pKVM. That said, I didn't know at the time that there might be a race
with some filesystems. I'll keep this in mind for the pKVM code we
have for now, and when upstreaming.

Thanks,
/fuad

> On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > page/folio dirty after it has been written back can make some filesystems
> > unhappy (backing KVM guests will such filesystem files is uncommon, and
>
> typo: s/will/with/
>
> > the race is minuscule, hence the lack of complaints).  See the link below
> > for details.
> >
> > This will also allow converting arm64 to kvm_release_faultin_page(), which
> > requires that mmu_lock be held (for the aforementioned reason).
> >
> > Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes at gmail.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/mmu.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 22ee37360c4e..ce13c3d884d5 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >       }
> >
> >  out_unlock:
> > +     if (writable && !ret)
> > +             kvm_set_pfn_dirty(pfn);
>
> I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
> a reference.
>
> > +     else
> > +             kvm_release_pfn_clean(pfn);
> > +
> >       read_unlock(&kvm->mmu_lock);
> >
> >       /* Mark the page dirty only if the fault is handled successfully */
> > -     if (writable && !ret) {
> > -             kvm_set_pfn_dirty(pfn);
> > +     if (writable && !ret)
> >               mark_page_dirty_in_slot(kvm, memslot, gfn);
> > -     }
> >
> > -     kvm_release_pfn_clean(pfn);
> >       return ret != -EAGAIN ? ret : 0;
> >  }
> >
> > --
> > 2.46.0.rc1.232.g9752f9e123-goog
> >
>
> --
> Thanks,
> Oliver
>

