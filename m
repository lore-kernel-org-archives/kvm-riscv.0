Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CBCC624D0
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpTy5AU9lGL7C0vawBfy3yWTWMaovqZWK318/ppOFDI=; b=MJ7N0OiV1yqNdZ
	vbotdYDhNVQgjfe7hmCdAi/uCIP3o9otLByHZM0vw0CyiVGLhWMRxtCDYPxOR3pS2ehbW0ubS443C
	/CEFDhMDmL/77ty41Xf0eJsmS75a1PtLocArkli8uVhki0GO8ZeH5GoL3VtFPqzxf2eX9CrlmaM0W
	cijWcDHN6G3zafLmlMij7WI4h5Fom+VkGva6wMv9EmwUHSclbcJwQR8zdCOg8z+MHmRtXj85aP4he
	IPZoSp/qIAY3CSzexOitkwUoC4Sh8oTolrVUM0o4kZILBjYHCHMd3kalu/vKu8SnVuXR7XKBvnKY8
	d9VqRxMrFIuzt0sXiIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaB-0000000EZGL-3gSe;
	Wed, 02 Sep 2026 11:56:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaA-0000000EZEe-0O1V;
	Wed, 02 Sep 2026 11:56:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAB7F1E32;
	Wed,  2 Sep 2026 04:56:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 511A93F85F;
	Wed,  2 Sep 2026 04:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350203; bh=a5z3VgCuV82F6RPeAfMv4Cs88UUw7cEiZjrKWSyb5gM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JWpWS3ffE1GLLis9po+Yz/mdLIadyKedxJ5+vnCEOzxzDhXnh6pni34o9WA3lPaY3
	 8YN4snZQJKN3Yzki8gEyuot6J5purDrlO7D076nrar2h0BRSWrEd+IKOfPbM2DjdVf
	 C07c/tMLjlLEZskvetTLzowjaVa4wJ6vh1NpkUUc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:03 +0100
Subject: [PATCH RFC v3 01/21] ARM: mm: make nommu pgd_t a scalar
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-1-5d8f5b17c25c@arm.com>
References: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
In-Reply-To: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
To: Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=yuk3S4RfznnTM9UkPeDtkv8dyVxIm22Z2ipCHlRDCbc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7idg6lSNQrEggQ4WH6Gwya5B5f1/qCND8aE
 jNsah22k92JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO4gAKCRBt1cPRWsUx
 M55BDACPu7Y6d+irL9cNnQwbHZMHkOrav9grp6zTgOsqQGAkkTBo7L2FFa0BeFXUyxp8SnK6hTV
 pltmcJWh2UV8lHAWMJVNmBSoFxKABbZ9m8XUqhLr+MDF5GUzkzGjgE5bSZHsTHg3sTFNnrWOqLM
 t6BAGepWC81BIRIjXzyJ2mZ3nZT/JgD8LZcNrSbGHdYnTQTepcdZmzhnoyimCOg99vs+8L3r2fW
 1VClNEqJS2ceT73Hq6m+JDHPWRdSzaONSKJBA/eJgzMe4GJgyEHi/3jgaVAeChVBhJznjucUMlx
 Ctmk4MhHoQDs+cJQD+cBseLnlWTZObzMPF2boQvkQJcACt/xdHAj9/1Qxpdv92bznvMpJpgY8i2
 SsRO65VvkR3Noc63S6LyyXsfSSojY+ZlBv4nXOOBEzY76T2rC3NdKLBGN9Ir5YK8Qni76UOhW1o
 2LO5bQUuEe+C1ZjHBi7KB2s4NUJ2IfWaKqpVdrd6w14DRusXbtpkm3DQ6MMJrXbwyFOOY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045646_234771_16AE6EBC 
X-CRM114-Status: GOOD (  13.54  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: "David Hildenbrand (Arm)" <david@kernel.org>

As pgd_t is returned  from a function, like pgdp_get(). pgd_t shouldn't be
an array.

There is no need to match the actual arm page tables, because with nommu
there are no page tables. It's all just in place to make the compiler
happy. Making it a scalar will make the compiler happy.

So let's just use an u32.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/page-nommu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/page-nommu.h b/arch/arm/include/asm/page-nommu.h
index e74415c959be..88659b38e236 100644
--- a/arch/arm/include/asm/page-nommu.h
+++ b/arch/arm/include/asm/page-nommu.h
@@ -18,12 +18,12 @@
  */
 typedef unsigned long pte_t;
 typedef unsigned long pmd_t;
-typedef unsigned long pgd_t[2];
+typedef unsigned long pgd_t;
 typedef unsigned long pgprot_t;
 
 #define pte_val(x)      (x)
 #define pmd_val(x)      (x)
-#define pgd_val(x)	((x)[0])
+#define pgd_val(x)      (x)
 #define pgprot_val(x)   (x)
 
 #define __pte(x)        (x)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
