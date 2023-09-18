From: Sean Christopherson <seanjc@google.com>
Date: Mon, 18 Sep 2023 08:57:45 -0700
Subject: [RFC PATCH v12 10/33] KVM: Set the stage for handling only shared
 mappings in mmu_notifier events
In-Reply-To: <9925e01b-7fa9-95e4-dc21-1d760ef9cde4@linux.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-11-seanjc@google.com>
 <9925e01b-7fa9-95e4-dc21-1d760ef9cde4@linux.intel.com>
Message-ID: <ZQhzeQLbB5zz2yIc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 18, 2023, Binbin Wu wrote:
> 
> 
> On 9/14/2023 9:55 AM, Sean Christopherson wrote:
> > Add flags to "struct kvm_gfn_range" to let notifier events target only
> > shared and only private mappings, and write up the existing mmu_notifier
> > events to be shared-only (private memory is never associated with a
> > userspace virtual address, i.e. can't be reached via mmu_notifiers).
> > 
> > Add two flags so that KVM can handle the three possibilities (shared,
> > private, and shared+private) without needing something like a tri-state
> > enum.
> 
> How to understand the word "stage" in short log?

Sorry, it's an idiom[*] that essentially means "to prepare for".  I'll rephrase
the shortlog to be more straightforward (I have a bad habit of using idioms).

[*] https://dictionary.cambridge.org/us/dictionary/english/set-the-stage-for

