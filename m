From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 18 Nov 2021 19:23:12 +0000
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_08/12=5D_KVM=3A_Propagate_vcpu?=
 =?US-ASCII?Q?_explicitly_to_mark=5Fpage=5Fdirty=5Fin=5Fslot=28=29?=
In-Reply-To: <YZagjzYUsixbFre9@google.com>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
 <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
 <YZaeL5YztL3p1nLM@google.com> <YZagjzYUsixbFre9@google.com>
Message-ID: <35AEC3FD-B46A-451D-B7D5-4B1BDD5407BD@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 18 November 2021 18:50:55 GMT, Sean Christopherson <seanjc@google.com> wrote:
>On Thu, Nov 18, 2021, Sean Christopherson wrote:
>> On Thu, Nov 18, 2021, David Woodhouse wrote:
>> > That leaves the one in TDP MMU handle_changed_spte_dirty_log() which
>> > AFAICT can trigger the same crash seen by butt3rflyh4ck ? can't that
>> > happen from a thread where kvm_get_running_vcpu() is NULL too? For that
>> > one I'm not sure.
>> 
>> I think could be trigger in the TDP MMU via kvm_mmu_notifier_release()
>> -> kvm_mmu_zap_all(), e.g. if the userspace VMM exits while dirty logging is
>> enabled.  That should be easy to (dis)prove via a selftest.
>
>Scratch that, the dirty log update is guarded by the new_spte being present, so
>zapping of any kind won't trigger it.
>
>Currently, I believe the only path that would create a present SPTE without an
>active vCPU is mmu_notifer.change_pte, but that squeaks by because its required
>to be wrapped with invalidate_range_{start,end}(MMU_NOTIFY_CLEAR), and KVM zaps
>in that situation.

Is it sufficient to have *an* active vCPU?  What if a VMM has threads for active vCPUs but is doing mmap/munmap on a *different* thread? Does that not suffer the same crash?


-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.

