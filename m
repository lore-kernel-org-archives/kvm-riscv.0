Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E154E8FDB1
	for <kvm-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Io4ISrcZ/3Gh+k0cbk/d1FY8Op0XrMXc1I/zPE/vT6Q=; b=DbxGf7OuA2Mn89
	xpUYAsivWOWea/ExzDNkawoCENJoBBHinaohjPg5XgcLeTHsB8gpa+1v2K/OxzfLrXwBiUP3LDnJc
	DFHnWAaDsHRpBGMUGtX5RDmQ65BPCxutIa/1F00XsJGaR7a+XFojFnYjow2kDHhojn2cyeFcC6U4W
	hC/ds7aeKoW8DBwPZ47H/gpPa91AuA+h+7MZI+wzIkrVUSlmvEdN2uaTGz4btSHxJXHL66wPILh0q
	LCuCgZ6QwVNAtWCo/5ONGvDPsJIt9Z/dLPiJW0yI6Q0qLj4qCw31an+PPSp+hfS2nQgCPxZuMoLt4
	vbRumhG3TfMMSrdDkBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7fv-00000003QhB-1K5B;
	Mon, 29 Dec 2025 07:28:19 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7fr-00000003QeW-1HPZ;
	Mon, 29 Dec 2025 07:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1766993211;
	bh=3N2ZF0EIrve8G0UVanB92qVexp3wyyghfgRFvk0nz20=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=brITrchrM8XeSfSe00B8DlrtUi1U79wK49AkPFPeIfWWVlSGDTL9mthDPQgolEuv/
	 XxYDwCzIkMWfxUuWtCVaTdkRkn0fZEmXYJ4cYZPLFGx6mPntqG4NzkGLUDg79ilb5t
	 qTj2UnqyYxJbiCaZ5/8elifV3pLZN95DoM7PQTpU=
X-QQ-mid: zesmtpsz5t1766993190t66218374
X-QQ-Originating-IP: 0mX17PCVUwNAxZCLo94gYEtJOiFGbOVlyPwIL3urOno=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Dec 2025 15:26:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7625754697422166379
EX-QQ-RecipientCnt: 11
From: Qiang Ma <maqianga@uniontech.com>
To: anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] RISC-V: KVM: Remove unnecessary 'ret' assignments
Date: Mon, 29 Dec 2025 15:25:30 +0800
Message-Id: <20251229072530.3075496-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NFNrK8KlcSCR9EA66xMf7tJVgZ9k+39++g4UbenDi2F6WeVvSDR2o4b6
	P/IH5mZrqlGdHXd9AyY3P9aWz1/mhvabYS7p2NU7zqx97uqd+eNDtBWdeoDzJ2HHboq4WDy
	9lOJp3935ygnDymM4/5HsYuTk/Ffz4Nvqpn+XYdzGBB/c6X586SXd4TZkLxgLACvUQYSDEO
	CJQEnW+ReUp36tz8eHwsMW8C+dcTDJoWNxvyZsUWBsRCyio+jdJhIq3Vz5B+KsmGl2BCrkE
	RdWmRkVmC26Q3Nk0+D0/a/1dlQbUW6pntCtqteTOG6fcQgcpytH9bsVgDJ9QqrKGb999fqB
	O3s0xVsFdEM15wfjkCMx3oXSYqnzqV9jdyXNO3qmezk47qpc8SuTbYScw6u6h5V5RRUPodP
	tEFXtsn5/J6kaib+6cM9y9DRw2RL9w+RkBTAHTCbu8hwJCY7gpSRV8e/6zbNvTZCmX4oTQ/
	EL6hVkKBRhXz0WVYGPd41ZU5el0gdJFHNN7oj3oWgjhn8jg300/rkawZ6e2tjLLjnhfz9ly
	CWqSIyKqNEeZxRwFR8rlxIIspjUFS89cBJdYdiKy4ge9ntj+Y69483KktxwhoT1Gt6ocYOW
	xclIScUt8Cp7Z9RVzrwAQMkX04WeP8o1f8slGQtogdzC3H58GKnQjJDCXaDXQdgTYkTKu5b
	Tg5lZd3c5juf+jh9p5iYm47mD9CWH6xKNg5EdUnt6vKRO0JKRMZZU+on+hoe7ceSedyk3X9
	ayNDmbBtZKTK1yu1f5YFSWkIil3JHB6I/X/9gQ0eln+zCbz5z9VKuM1XT4GdvsXl5t3ZDBz
	DpokjwoJMmaQwr6t37diJsqZes8wpNnxoSp5j9tCCslRpeFBLbDNzbXRAT+AjHlnFV3hjin
	9xZsD0mmWPuQCMGwOhLkjtlwwhd/fvSC450FMncA6VtOsXUwTqEQcTGhp7/KfA4P3ytqKhC
	2C4POwh1jPscnNIXNUzPswls7oxhpT3WoPpfQ13TJU4aXWa+L+3lcRLD2VT61lF3qiGatMu
	GOwmZncQr6lk/ddP2+
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_232816_630276_52D9787A 
X-CRM114-Status: UNSURE (   9.04  )
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

If the program can execute up to this point, indicating that
kvm_vcpu_write_guest() returns 0, and the actual value of
SBI_SUCCESS is also 0. At this time, ret does not need to be
assigned a value of 0.

Fixes: e309fd113b9f ("RISC-V: KVM: Implement get event info function")

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index a2fae70ee174..4d8d5e9aa53d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -494,12 +494,9 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long saddr_low
 	}
 
 	ret = kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
-	if (ret) {
+	if (ret)
 		ret = SBI_ERR_INVALID_ADDRESS;
-		goto free_mem;
-	}
 
-	ret = 0;
 free_mem:
 	kfree(einfo);
 out:
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
