Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00425606D828
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 12:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NIKddfyj;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ZpxehKK5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qmyfP4/aV2B73iGZxzc38WWrebnuet/mhn5n3SlR27E=; b=NIKddfyjT6mTffWiskkWl+DkQz
	671EXAJrVcrOYQOsbN0E1QYwU+7+v1dqnDaC1w7qCLPQvOv0sOISI0vISVy6qKcWUlhrnwzcUTQ+6
	CM56q5S7Q1dxExDI7OW9QCWb/XdXhtMJKArsTccyb/xXSbp7xfC7frjRpoaEAxztdvo2IecirPsry
	wcWbOVMTzMwcFXSCK7mSscx5RsAverYEaRuXXt4lEGqs3uarafnljzQ765C51amo0girgym8KwVYi
	sb0tqxzmTAjk6Li+eeFnHQnKLjA9p9MWVz5FgbOtpk/b1JvtW8ayyQUtXVw+dosYvk/l4kJxG80z+
	4zwE384g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODET-00000002J99-2wbA;
	Tue, 03 Nov 2026 12:03:17 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODER-00000002J3c-2Vlo;
	Tue, 03 Nov 2026 12:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793707393; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=9rfG8B97sjeTTjA0eUoy55WlemACgXA3zSFldzaZYdk=;
	b=ZpxehKK5uYo9wylmW9+2xojy0r5hWkyqoDgH89WHSGscuAx67LQ8BfPJvvnf4EtVLAMBm1UMAnH75MiWRWGkrmsyPVVDDPNhlNxd3Su2ThE90vpxLZGgQ2wYgpEVMwIoa0KmJ4RnY7uy1VrpzYWQ1JOyJfG3ToJIiK6XA4yQl04=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0XE2qH-i_1793707389;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE2qH-i_1793707389 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 20:03:11 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 06/10] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Tue,  3 Nov 2026 20:02:32 +0800
Message-Id: <20261103120236.53474-7-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
References: <20261103120236.53474-1-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_040315_828769_4693D681 
X-CRM114-Status: UNSURE (   4.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index f7e4d0f9b156..13552cfc2cd3 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -28,8 +28,10 @@ config KVM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select VIRT_XFER_TO_GUEST_WORK
+	select KVM_VFIO
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select SRCU
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
