From: Thomas Huth <thuth@redhat.com>
Date: Fri, 3 Feb 2023 11:54:52 +0100
Subject: [PATCH 3/7] KVM: Move KVM_GET_NR_MMU_PAGES into the deprecation
 section
In-Reply-To: <CQ8UM1FTPEUZ.3F2RONR3AJ5YP@bobo>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-4-thuth@redhat.com> <CQ8UM1FTPEUZ.3F2RONR3AJ5YP@bobo>
Message-ID: <2c37f524-593f-a155-a01f-57a68b2e362c@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 03/02/2023 11.16, Nicholas Piggin wrote:
> On Fri Feb 3, 2023 at 7:42 PM AEST, Thomas Huth wrote:
>> The KVM_GET_NR_MMU_PAGES ioctl is quite questionable on 64-bit hosts
>> since it fails to return the full 64 bits of the value that can be
>> set with the corresponding KVM_SET_NR_MMU_PAGES call. This ioctl
>> likely has also never really been used by userspace applications
>> (at least not by QEMU and kvmtool which I checked), so it's better
>> to move it to the deprecation section in kvm.h to make it clear for
>> developers that this also should not be used in new code in the
>> future anymore.
> 
> Did this get included in the series inadvertently?

No, it's here on purpose, as a second step to patch 2/7 (and a follow up 
from the discussion last year, see 
https://lore.kernel.org/kvm/YpZu6%2Fk+8EydfBKf at google.com/ ) ... sorry, I 
should have elaborated on this in the cover letter, too.

  Thomas


