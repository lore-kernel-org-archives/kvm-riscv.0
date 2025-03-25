Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746FCC35FFC
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLbSv2mSWLL9uy+o7ZpSsKjKSbJxDmUiHP3ck97k2Ho=; b=MWHZ1sfsBI050u
	HZt0K4j+OSjzwHwhEAWAOZE/r8pu59w8+hdpN1gz8fU47q1of8OLJGsNkW0hgObf9N/ZGQFE17EbD
	B3+sYkg4dXYgtDkSZdWs3ve93j2ThS+ce39bmqiEfV+FY3IZZTjrHBby4fa/GS0E2hu5q4aNskPlj
	OXugWc7aUDuNkOxMQ7eqxQiYEVKSzeWieGLVi9KaRnU5Z5PFxOylB4KOTBXw2BVBb7bZOhWkvaudL
	HXTWf5VirwpCDjFQ1JfrP+aUFb4A95jtc2iETg3U7FZvkpkJ9lrQQHm9P03z0xgBzoxyIRFttj5JO
	OMYV7+y2O5VLXVby08cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4im-000000066Cg-0CKJ;
	Tue, 25 Mar 2025 13:53:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3GI-00000005msO-41m5;
	Tue, 25 Mar 2025 12:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C0F443650;
	Tue, 25 Mar 2025 12:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4631C4CEED;
	Tue, 25 Mar 2025 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905206;
	bh=S5onwW8Rhyiou8sUliJC71k2++Mi5WmKeWwnQHNXJR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SLdkNpDMElfs6JtH93HL2qjB8ooc8njsv/pKcwCApdLyBmrRvX5jPuX625CrCL3KO
	 LLg2i7GO2jiDdmvOrZJHbXmmZ//hxLsMMV2R487NeFcTSsmqjUedkLmuzv7hLlERU6
	 kiuccu5qk3IkbjYpbkj/s/pT/RPFgjJK5adv7y6A6BEEgO8BBTscDUHE/YjxJcfAd0
	 ppo9vCiFRV5Tz05przlyIDyBiWv9hSmTIygPLI/aoXi+ZELjeBp9iCTv0eEu9tP+Tz
	 vHMjNE6CxPdHgma3URda2HPkGEEkWTjPcCLQMXFENwL53LrB+OGroHLD8Txjexf9jd
	 7/iF+KyP6XFLQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	torvalds@linux-foundation.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	oleg@redhat.com,
	kees@kernel.org,
	tglx@linutronix.de,
	will@kernel.org,
	mark.rutland@arm.com,
	brauner@kernel.org,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	edumazet@google.com,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	gaohan@iscas.ac.cn,
	shihua@iscas.ac.cn,
	jiawei@iscas.ac.cn,
	wuwei2016@iscas.ac.cn,
	drew@pdp7.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	ctsai390@andestech.com,
	wefu@redhat.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	mingo@redhat.com,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	guoren@kernel.org,
	xiao.w.wang@intel.com,
	qingfang.deng@siflower.com.cn,
	leobras@redhat.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	yongxuan.wang@sifive.com,
	luxu.kernel@bytedance.com,
	david@redhat.com,
	ruanjinjie@huawei.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	qiaozhe@iscas.ac.cn
Cc: ardb@kernel.org,
	ast@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-nfs@vger.kernel.org,
	linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [RFC PATCH V3 14/43] rv64ilp32_abi: riscv: Adapt kernel module code
Date: Tue, 25 Mar 2025 08:15:55 -0400
Message-Id: <20250325121624.523258-15-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_052007_039560_7F001D66 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

Because riscv_insn_valid_32bit_offset is always true for ILP32,
use BITS_PER_LONG instead of CONFIG_64BIT.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kernel/module.c   | 2 +-
 include/asm-generic/module.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 47d0ebeec93c..d7360878e618 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -45,7 +45,7 @@ struct relocation_handlers {
  */
 static bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
 {
-#ifdef CONFIG_32BIT
+#if BITS_PER_LONG == 32
 	return true;
 #else
 	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
diff --git a/include/asm-generic/module.h b/include/asm-generic/module.h
index 98e1541b72b7..f870171b14a8 100644
--- a/include/asm-generic/module.h
+++ b/include/asm-generic/module.h
@@ -12,7 +12,7 @@ struct mod_arch_specific
 };
 #endif
 
-#ifdef CONFIG_64BIT
+#if BITS_PER_LONG == 64
 #define Elf_Shdr	Elf64_Shdr
 #define Elf_Phdr	Elf64_Phdr
 #define Elf_Sym		Elf64_Sym
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
