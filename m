From: Huang, Kai <kai.huang@intel.com>
Date: Tue, 3 Sep 2024 12:48:47 +1200
Subject: [PATCH v4 01/10] KVM: Use dedicated mutex to protect
 kvm_usage_count to avoid deadlock
In-Reply-To: <ZtHPusyTNkQ_a1Y-@google.com>
References: <20240830043600.127750-1-seanjc@google.com>
 <20240830043600.127750-2-seanjc@google.com>
 <1f037b5604deb5f83f05e709b2edf3063372518f.camel@intel.com>
 <ZtHPusyTNkQ_a1Y-@google.com>
Message-ID: <7aa6ab47-2492-43f3-bf4f-ea50e2464894@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 31/08/2024 1:57 am, Sean Christopherson wrote:
> On Fri, Aug 30, 2024, Kai Huang wrote:
>>
>>> Reviewed-by: Kai Huang <kai.huang@intel.com>
>>> Acked-by: Kai Huang <kai.huang@intel.com>
>>>
>>
>> Hmm I must have done a lot for me to receive two credits (and for most patches
>> in this series) :-)
>>
>> I think one Reviewed-by tag is good enough :-)
> 
> Heh, indeed.  b4 has made me very lazy; I just `b4 am` the patches and let b4
> grab all the trailers.  

That's what I was thinking about too.

> I'm guessing something went awry in that flow (or maybe
> you acked a previous version or something?)

Anyway will pay more attention to this.  Thanks!

