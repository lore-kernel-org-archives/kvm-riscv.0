From: Sean Christopherson <seanjc@google.com>
Date: Thu, 18 Nov 2021 19:46:56 +0000
Subject: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
In-Reply-To: <35AEC3FD-B46A-451D-B7D5-4B1BDD5407BD@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
 <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
 <YZaeL5YztL3p1nLM@google.com> <YZagjzYUsixbFre9@google.com>
 <35AEC3FD-B46A-451D-B7D5-4B1BDD5407BD@infradead.org>
Message-ID: <YZatsB3oadj6dgb8@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 18, 2021, David Woodhouse wrote:
> 
> 
> On 18 November 2021 18:50:55 GMT, Sean Christopherson <seanjc@google.com> wrote:
> >On Thu, Nov 18, 2021, Sean Christopherson wrote:
> >> On Thu, Nov 18, 2021, David Woodhouse wrote:
> >> > That leaves the one in TDP MMU handle_changed_spte_dirty_log() which
> >> > AFAICT can trigger the same crash seen by butt3rflyh4ck ? can't that
> >> > happen from a thread where kvm_get_running_vcpu() is NULL too? For that
> >> > one I'm not sure.
> >> 
> >> I think could be trigger in the TDP MMU via kvm_mmu_notifier_release()
> >> -> kvm_mmu_zap_all(), e.g. if the userspace VMM exits while dirty logging is
> >> enabled.  That should be easy to (dis)prove via a selftest.
> >
> >Scratch that, the dirty log update is guarded by the new_spte being present, so
> >zapping of any kind won't trigger it.
> >
> >Currently, I believe the only path that would create a present SPTE without an
> >active vCPU is mmu_notifer.change_pte, but that squeaks by because its required
> >to be wrapped with invalidate_range_{start,end}(MMU_NOTIFY_CLEAR), and KVM zaps
> >in that situation.
> 
> Is it sufficient to have *an* active vCPU?  What if a VMM has threads for
> active vCPUs but is doing mmap/munmap on a *different* thread? Does that not
> suffer the same crash?

It is sufficient for the current physical CPU to have an active vCPU, which is
generally guaranteed in the MMU code because, with a few exceptions, populating
SPTEs is done in vCPU context.

mmap() will never directly trigger SPTE creation, KVM first requires a vCPU to
fault on the new address.  munmap() is a pure zap flow, i.e. won't create a
present SPTE and trigger the writeback of the dirty bit.

That's also why I dislike using kvm_get_running_vcpu(); when it's needed, there's
a valid vCPU from the caller, but it deliberately gets dropped and indirectly
picked back up.

