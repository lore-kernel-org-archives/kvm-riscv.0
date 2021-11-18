From: Sean Christopherson <seanjc@google.com>
Date: Thu, 18 Nov 2021 18:40:47 +0000
Subject: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
In-Reply-To: <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
 <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
 <20b5952e76c54a3a5dfe5a898e3b835404ac6fb1.camel@infradead.org>
Message-ID: <YZaeL5YztL3p1nLM@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 18, 2021, David Woodhouse wrote:
> That leaves the one in TDP MMU handle_changed_spte_dirty_log() which
> AFAICT can trigger the same crash seen by butt3rflyh4ck ? can't that
> happen from a thread where kvm_get_running_vcpu() is NULL too? For that
> one I'm not sure.

I think could be trigger in the TDP MMU via kvm_mmu_notifier_release()
-> kvm_mmu_zap_all(), e.g. if the userspace VMM exits while dirty logging is
enabled.  That should be easy to (dis)prove via a selftest.

And for the record :-)

On Mon, Dec 02, 2019 at 12:10:36PM -0800, Sean Christopherson wrote:
> IMO, adding kvm_get_running_vcpu() is a hack that is just asking for future
> abuse and the vcpu/vm/as_id interactions in mark_page_dirty_in_ring()
> look extremely fragile.

On 03/12/19 20:01, Sean Christopherson wrote:
> In case it was clear, I strongly dislike adding kvm_get_running_vcpu().
> IMO, it's a unnecessary hack.  The proper change to ensure a valid vCPU is
> seen by mark_page_dirty_in_ring() when there is a current vCPU is to
> plumb the vCPU down through the various call stacks.

