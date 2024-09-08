From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 8 Sep 2024 16:10:19 +0200
Subject: [PATCH 6.6 4/4] riscv: Use accessors to page table entries
 instead of direct dereference
In-Reply-To: <D68939319C9C81B0+20240906082254.435410-4-wangyuli@uniontech.com>
References: <20240906082254.435410-1-wangyuli@uniontech.com>
 <D68939319C9C81B0+20240906082254.435410-4-wangyuli@uniontech.com>
Message-ID: <2024090808-elusive-deviate-3bbb@gregkh>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 06, 2024 at 04:22:39PM +0800, WangYuli wrote:
> From: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> [ Upstream commit edf955647269422e387732870d04fc15933a25ea ]
> 
> As very well explained in commit 20a004e7b017 ("arm64: mm: Use
> READ_ONCE/WRITE_ONCE when accessing page tables"), an architecture whose
> page table walker can modify the PTE in parallel must use
> READ_ONCE()/WRITE_ONCE() macro to avoid any compiler transformation.
> 
> So apply that to riscv which is such architecture.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Acked-by: Anup Patel <anup@brainfault.org>
> Link: https://lore.kernel.org/r/20231213203001.179237-5-alexghiti at rivosinc.com
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---

all now queued up, thanks.

greg k-h

