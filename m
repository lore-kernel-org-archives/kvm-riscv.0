From: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Jun 2022 14:41:02 +0000
Subject: [PATCH 2/3] KVM: selftests: Consolidate boilerplate code in
 get_ucall()
In-Reply-To: <de35d629-e076-e02d-7482-c93de628dd82@intel.com>
References: <20220618001618.1840806-1-seanjc@google.com>
 <20220618001618.1840806-3-seanjc@google.com>
 <de35d629-e076-e02d-7482-c93de628dd82@intel.com>
Message-ID: <YrHYfiI+54hAp0vv@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 19, 2022, Huang, Shaoqin wrote:
> 
> 
> On 6/18/2022 8:16 AM, Sean Christopherson wrote:
> > Consolidate the actual copying of a ucall struct from guest=>host into
> > the common get_ucall().  Return a host virtual address instead of a guest
> > virtual address even though the addr_gva2hva() part could be moved to
> > get_ucall() too.  Conceptually, get_ucall() is invoked from the host and
> > should return a host virtual address (and returning NULL for "nothing to
> > see here" is far superior to returning 0).
> 
> It seems the get_ucall() returns the uc->cmd, the ucall_arch_get_ucall()
> returns a host virtual address.

Yep, get_ucall() then does the memcpy() from guest memory via that host virtual
addres and returns the resulting ucall command.  The intent is that the arch
hooks are not to be called by common code.

