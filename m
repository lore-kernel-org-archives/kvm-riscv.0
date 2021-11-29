From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 29 Nov 2021 18:55:19 +0100
Subject: [PATCH v2 11/43] KVM: Don't block+unblock when halt-polling is
 successful
In-Reply-To: <YaUNBfJh35WXMV0M@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-12-seanjc@google.com>
 <cceb33be9e2a6ac504bb95a7b2b8cf5fe0b1ff26.camel@redhat.com>
 <4e883728e3e5201a94eb46b56315afca5e95ad9c.camel@redhat.com>
 <YaUNBfJh35WXMV0M@google.com>
Message-ID: <ba8341d6-7ee7-1af1-1385-0a9226bbf952@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/29/21 18:25, Sean Christopherson wrote:
>> If I apply though only the patch series up to this patch, my fedora VM seems
>> to work fine, but my windows VM still locks up hard when I run 'LatencyTop'
>> in it, which doesn't happen without this patch.
> 
> Buy "run 'LatencyTop' in it", do you mean running something in the Windows guest?
> The only search results I can find for LatencyTop are Linux specific.

I think it's LatencyMon, https://www.resplendence.com/latencymon.

Paolo

