Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218A3C624D6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLoJqpYoSmPfiPjuS/HWvi1TTr5Ddtuu/z1sSF0nmvg=; b=rXrLSuG5Q0ONTk
	XTUGgwLwMB6MYLAXzXnbN8h+mhyaFKScjwnMImEmrlOmZv0M9d8gRhHsViFm9Shsda1lYO5uYfIP9
	9dgTK3JECIWfeM8w6SpMGGvYXlOiH/CiUyvgAWpOKJ3TtNgouIcJFyU8r9WCSCcDE7uvx7SlSqr+K
	n2NdF6UWRIDDKW1wVIMSj1qeOHICWDOt9S9xwsCbX56I+qTKnvvGCvCRPmzmQSXgntP8li8PkCJIp
	LdmCyvgz9wvTxccJ3PnBFcpjVhbSqmpJ3bC4gdvEwAdnWDF0bC4YIJKb5y9m41NJdgWnJS2gqI3bB
	B8Sc3mi2muhpsQ2xtmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaP-0000000EZOK-3Mbs;
	Wed, 02 Sep 2026 11:57:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaN-0000000EZMt-0EcQ;
	Wed, 02 Sep 2026 11:57:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 961661596;
	Wed,  2 Sep 2026 04:56:54 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EC283F85F;
	Wed,  2 Sep 2026 04:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350218; bh=mi4xjJsCAhGuG1KP2jLhKq+FK/V2NIyuuhsagoZBG7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DBs+SEJ/tWGTTLaux+S1LwsrrYGBwQV3ATuKZgMbvei+jVh1WSY/M2QC4NxmGgA1y
	 i7m5xO5OZ/Kze26/9ZcqAvwphvv8ZcI6T4TjkMJLHNM7089rPf0Uh66u16hKJ2O/bw
	 eUVTOabXRMEhFzmJCMwjz8dAs2j1D7hwhGxnsB4s=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:05 +0100
Subject: [PATCH RFC v3 03/21] ARM: mm: remove custom pgdp_get()
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-3-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=792; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=Kei+qz90eZd/Rla66RuJIaqD0aMM/I6F6uU024NhR+s=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7jjEkXgd07toBiXhGHtW6l2HJSNxf8EJFQR
 MrLQ8sVkn2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO4wAKCRBt1cPRWsUx
 M6UpDACvafb5I6qRyuKtjC3o3BB6X1x2pDkn7WzYN1XkHRJTOSQqVabpYB98QmaZehBIp+rjcY5
 8XhZPr4/VlBHOVk3oTKXafUozy78zoYZq0S0E3Lf2aAZxvVYJ2NiTRRojaaLsZjYC90Gh0q972O
 Rz/p7u4wzhU9+zIBlnLnLO0sHStfpkZzqgRmFRNN/cNQcudRxV/D0DvX3QUiHospfakh8Gzd+tw
 YagxhalJiyRHw1OpcDf+m4tYW4H3OvMHS425VPwVBRIIouFfanScIRA0+fKzG0k4IK2M2wrA02H
 KrgC0K5GAs47HdDG3A/K8w5D4465AqabgyFWC/Z45fkdQwIBIeMAYZZ0m0GQzSVgwFcP4uCsTeT
 g65+aH2rnoY/2z+l0jnY4nIE9dI1zATCV6ZhkOXlXqpUwtP1NdLmkFwU+Dzgi7M8aclQ4OMOAwx
 Hd2do+6aUtYqw9yndif4b5hrcikHznxCCtm2jeKnhCm3VafyuCD3Yr1/8LH2X6S9Li8T4=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045659_194816_40351FC9 
X-CRM114-Status: GOOD (  10.42  )
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

Now that pgd_t is no longer an array and rely on the common
code pgdp_get(), which is a static inline function that returns pgd_t.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 8dd17d20faa3..ff3868acea94 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -134,8 +134,6 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
-#define pgdp_get(pgpd)		READ_ONCE(*pgdp)
-
 #define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
 #define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
