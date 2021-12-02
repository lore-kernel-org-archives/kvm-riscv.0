From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 2 Dec 2021 11:31:28 +0100
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
In-Reply-To: <Yagoo7R8P5xVilsj@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
 <496c2fc6-26b0-9b5d-32f4-2f9e9dd6a064@redhat.com>
 <YaUiEquKYi5eqWC0@google.com>
 <880a5727-69d1-72a1-b129-b053781625ad@redhat.com>
 <458c0819a578ba854f00089bc312c8faa177a81a.camel@redhat.com>
 <32eabe7d270e5a466ba2d9345b4270b8fe27700c.camel@redhat.com>
 <Yagoo7R8P5xVilsj@google.com>
Message-ID: <6200f141-8e6f-fe68-9539-22aa68559cb7@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/2/21 03:00, Sean Christopherson wrote:
> Hmm, that suggests the bug/erratum is due to the CPU consuming stale data from #4
> for the IsRunning check in #5, or retiring uops for the IsRunning check before
> retiring the vIRR update.

Yes, this seems to be an error in the implementation of step 5.  In 
assembly, atomic operations have implicit memory barriers, but who knows 
what's going on in microcode.  So either it's the former, or something 
is going on that's specific to the microcode sequencer, or it's a more 
mundane implementation bug.

In any case, AVIC is disabled for now and will need a list of model 
where it works, so I'll go on and queue the first part of this series.

Paolo

> It would be helpful if the erratum actually provided
> info on the "highly specific and detailed set of internal timing conditions". :-/
> 
>    4. Lookup the vAPIC backing page address in the Physical APIC table using the
>       guest physical APIC ID as an index into the table.
>    5. For every valid destination:
>       - Atomically set the appropriate IRR bit in each of the destinations? vAPIC
>         backing page.
>       - Check the IsRunning status of each destination.


