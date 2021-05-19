From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 19 May 2021 17:26:41 +0200
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <20210519150814.GY1955@kadam>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com> <YKTsyyVYsHVMQC+G@kroah.com>
 <d7d5ad76-aec3-3297-0fac-a9da9b0c3663@redhat.com>
 <YKUDWgZVj82/KiKw@kroah.com>
 <daa30135-8757-8d33-a92e-8db4207168ff@redhat.com>
 <YKUZbb6OK+UYAq+t@kroah.com> <20210519150814.GY1955@kadam>
Message-ID: <1ce20fe0-0fea-406a-f7bf-1dde686b411a@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/05/21 17:08, Dan Carpenter wrote:
> It's sort of frustrating that none of this information was in the commit
> message.
> 
> "This code is not ready to be merged into the arch/risc/ directory
> because the RISC-V Foundation has not certified the hardware spec yet.
> However, the following chips have implemented it ABC12345, ABC6789 and
> they've already shipping to thousands of customers since blah blah blah
> so we should support it."
> 
> I honestly thought it was an issue with the code or the userspace API.

Yes, I was expecting this to be in the staging TODO file - I should have 
been more explicit with Anup.

Paolo


