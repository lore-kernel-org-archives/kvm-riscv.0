From: Matthew Wilcox <willy@infradead.org>
Date: Wed, 27 Sep 2023 08:16:47 +0100
Subject: [PATCH v2 1/3] RISC-V: Detect and Enable Svadu Extension Support
In-Reply-To: <20230922085701.3164-2-yongxuan.wang@sifive.com>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-2-yongxuan.wang@sifive.com>
Message-ID: <ZRPW3wu6tpKwwunD@casper.infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 22, 2023 at 08:56:47AM +0000, Yong-Xuan Wang wrote:
> We detect Svadu extension support from DTB and add arch_has_hw_pte_young()
> to enable optimization in MGLRU and __wp_page_copy_user() if Svadu
> extension is available.

If you're going to cc people outside the RiscV space, you should probably
explain what Svadu is.  To me, it sounds like a Great Old One, maybe a
friend of Cthulhu?

