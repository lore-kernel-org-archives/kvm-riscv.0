Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D640DCCD199
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 03:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BOq+5x6/TFd+flURADEuVe9w3UMJjKkwD9LVK42Z+fM=; b=q2oswuLL3znRdc
	sKFizbk19rYdrRBUG2EleHW/2+b+sgcK8HDGRem/JLGjvDIo0rYAd5xLDI5aBAhFbSreitn0XLt6F
	L84LTe9ZacAlXDfhlhHQvByzGa+ses2LqefVBIgCMJstKlG0mKSn2BfKbOINsstNUXxskkQF2ckPG
	taHKfqFNdd2zFR02tSZk9J/D/awkIZhFi0FO9eN/KPw2QDa2E/eiOHL52QFDrfDZnviTc7FZmAvQ3
	b5rSUgw6qlJozkS1/XS49QtCsU1nRLnoEfYxiWOC7Yy6kVghi+44kC0zC8e4Xswo2J/3O/WBs+CTh
	AfkmucdD24SiY7slZUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9atu-00000006Rog-3WGM;
	Fri, 17 Oct 2025 03:13:06 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9atr-00000006Rn8-1AED
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 03:13:04 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4cnqdJ5MmKz4xNt8;
	Fri, 17 Oct 2025 11:12:52 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 59H3Crie045929;
	Fri, 17 Oct 2025 11:12:53 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202510170312.59H3Crie045929@mse-fl2.zte.com.cn>
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 59H397nc041863;
	Fri, 17 Oct 2025 11:09:07 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njy2app04[null])
	by mapi (Zmail) with MAPI id mid204;
	Fri, 17 Oct 2025 11:09:08 +0800 (CST)
Date: Fri, 17 Oct 2025 11:09:08 +0800 (CST)
X-Zmail-TransId: 2afc68f1b354273-3e67c
X-Mailer: Zmail v1.0
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <kvm-riscv@lists.infradead.org>, <ajones@ventanamicro.com>
Subject: =?UTF-8?B?W1BBVENIIDAvMl0gS1ZNOiBzZWxmdGVzdHM6IHJpc2N2IHZtIHNhdHAgbW9kZXMgc3VwcG9ydMKg?=
X-MAIL: mse-fl2.zte.com.cn 59H3Crie045929
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Fri, 17 Oct 2025 11:12:52 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68F1B434.000/4cnqdJ5MmKz4xNt8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_201303_476772_34BEA09D 
X-CRM114-Status: UNSURE (   3.95  )
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

Riscv kvm selftests set default vm mode to sv48, which causes tests to
fail on platform supporting sv39 only, such as '-cpu rva23s64' on qemu.
Also, the current vm modes cannot represent riscv satp modes precisely,
so riscv specific modes are added.

Wu Fei (2):
  KVM: riscv: selftests: Add riscv vm satp modes
  KVM: riscv: selftests: Detect supported vm modes

 .../testing/selftests/kvm/include/kvm_util.h  |  9 ++-
 .../selftests/kvm/include/riscv/processor.h   |  2 +
 tools/testing/selftests/kvm/lib/guest_modes.c | 25 +++++---
 tools/testing/selftests/kvm/lib/kvm_util.c    | 15 +++++
 .../selftests/kvm/lib/riscv/processor.c       | 57 +++++++++++++++++--
 5 files changed, 96 insertions(+), 12 deletions(-)

--
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
