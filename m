From: David Matlack <dmatlack@google.com>
Date: Mon, 30 Oct 2023 11:19:43 -0700
Subject: [PATCH v13 03/35] KVM: Use gfn instead of hva for mmu_notifier_retry
In-Reply-To: <ZT_fnAcDAvuPCwws@google.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-4-seanjc@google.com>
 <ZT_fnAcDAvuPCwws@google.com>
Message-ID: <CALzav=cjq_MbJgi3DMytVWwZLFxEPi1dp7YiBYRBw-sRf2+BLw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 30, 2023 at 9:53?AM David Matlack <dmatlack@google.com> wrote:
>
> On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> > From: Chao Peng <chao.p.peng@linux.intel.com>
> >
> > +void kvm_mmu_invalidate_range_add(struct kvm *kvm, gfn_t start, gfn_t end);
>
> What is the reason to separate range_add() from begin()?

Nevermind, I see how it's needed in kvm_mmu_unmap_gfn_range().

