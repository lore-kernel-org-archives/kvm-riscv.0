Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30B2C36012
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FoHLl5DiXk0ru/MrDmCwkSQPJqecHHq1idp6TOVYgw=; b=hkJ6gD9wxH2+3W
	mcwJhfCEPbmYgrHtmTqNeQbuUKnht+aMAvI/lSKFpMOqFV1D/By/c/BsskTCB+Z0ZDP3EkLl3xns2
	Os5sO+8Q+hhr/WgGRLWQSPCJB6FieH0JOBcgJsVnSVcFcqUYElzWRr0Xl9FsBinZLUBmaTgymRqHx
	z9Jvi4SqOcmPGL6/ZAHMILY5TARcYpBg0q7xY/TERbYO5hHEgZosB9idzy8ZM7sG6gzDDNx4YLmcw
	YbFiD3wszpq7gcW8uy55lXVbbgiOdA7sbN1Geet8WLW3Au373KBD4nrMPj6zm/jgQ/EXz6DClD7Me
	Ukw4gn/hPs9Pq3PSBF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4iv-000000066N6-2vlX;
	Tue, 25 Mar 2025 13:53:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Ic-00000005nVz-1lBs;
	Tue, 25 Mar 2025 12:22:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A03D061593;
	Tue, 25 Mar 2025 12:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F4EC4CEE4;
	Tue, 25 Mar 2025 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742905349;
	bh=eZJhhLnjsJ5KjWkXGFxCn3MEvfIMBL+8sG27XCid5KE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qevNB9uNRXUhGTfVJr+DKl6lS8FQeFJOY4f7ttg3jO2P7YXXcyp32FuamCgRbpfp6
	 Tj8ZRiyJrxpkmlppbuR0aTZlagq4HpBxvwcxFyDkvXMwezEgXXrlUpqBLGrm+vhQVE
	 9kwRr/BG5obSIi/E5vhu4AY8QmWoUzLcx2UvdyDSQLaiwaxvQJ5CeLSKOf3FwJJ5E/
	 hXAzq1VCYp+EoL2e1cTTQa5pm9NoxQr4RcYtb1wSopiaMM/m+ZruEqXbAWZjV+7luh
	 k16fsX64eUOJWO5eXZk1Sat/sU8lm9uDUQzukBAAtX2breq8iLsn6lrcBr2XGHy3Dn
	 z3KzNteqnEguQ==
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
Subject: [RFC PATCH V3 24/43] rv64ilp32_abi: compiler_types: Add "long long" into __native_word()
Date: Tue, 25 Mar 2025 08:16:05 -0400
Message-Id: <20250325121624.523258-25-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
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

The rv64ilp32 abi supports native atomic64 operations. The
atomic64_t is defined by "long long," so add "long long" into
__native_word().

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 include/linux/compiler_types.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 981cc3d7e3aa..6cf36a8e9570 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -505,9 +505,16 @@ struct ftrace_likely_data {
 			 default: (x)))
 
 /* Is this type a native word size -- useful for atomic operations */
+#ifdef CONFIG_64BIT
+#define __native_word(t) \
+	(sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
+	 sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long) || \
+	 sizeof(t) == sizeof(long long))
+#else
 #define __native_word(t) \
 	(sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
 	 sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
+#endif
 
 #ifdef __OPTIMIZE__
 # define __compiletime_assert(condition, msg, prefix, suffix)		\
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
