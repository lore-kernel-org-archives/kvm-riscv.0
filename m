Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617DACAC592
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhiCAL5WxcVVj5Bb+v5nhY1HJJmWHGTBxNL/hqt0RY0=; b=eudTL7397ympjK
	7StCD89/c0M7ZookUhfoB21MEk6903MBmLPc4ORkoHqCWGmj9lmccRShH6HvnREf0zNKdH0RFn/7I
	EtUycPuUxWSF/ZsqM15yiwVhlyhmgZeN8rSg+ni9PveBu0gynQVRP0wDp3Ks4V4BzOpYdMCZN4r9W
	OWu+gGNA5RQP9pOrzFWEnc6I0+mniFs5CKPjV+U5eWB0krqBvKWlyiWSV6ogSq9n4gGNvKiiUJ/vL
	7q4lBG+pRxGCtPQXYYu3mx7cQqGHs+O0CRVwloNu13LaA/Z6ZA9z2O4umbB9kPxtT/IZcA5KhTtRc
	n8M9DHlWEiRdASAkz+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7Pb-00000003uT5-3RRz;
	Mon, 15 Sep 2025 11:30:23 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7PZ-00000003uPu-01ti;
	Mon, 15 Sep 2025 11:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=47
	DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=nRes1P59wp9fYzplsx
	a69S08t/AKtIEApSDM6L9sg6rHZThIp4j8kdRcCoV0YPdLPyi6hcQyrFakgyDVhS
	VwzjFcKKSaGXf8tCiP9S2zqPuY455kKYPhr+nFCejc1NflGomvO0DcPnlBcyg6Xn
	jhNoTgBLNeiSAMtE94e1x7o/4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnU+G4+MdomWZMDA--.15853S2;
	Mon, 15 Sep 2025 19:30:01 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: anup@brainfault.org
Cc: ajones@ventanamicro.com,
	atish.patra@linux.dev,
	conor.dooley@microchip.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nutty.liu@hotmail.com,
	paul.walmsley@sifive.com,
	tjytimi@163.com,
	yongxuan.wang@sifive.com
Subject: Re:Re: [PATCH v3] riscv: skip csr restore if vcpu preempted reload
Date: Mon, 15 Sep 2025 19:29:59 +0800
Message-ID: <20250915112959.1337857-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhSdy27hnGS3HOazwnR4Y+SCk94RLnz5CA1kDkzsx7QH3dmwA@mail.gmail.com>
References: <CAAhSdy27hnGS3HOazwnR4Y+SCk94RLnz5CA1kDkzsx7QH3dmwA@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: PigvCgDnU+G4+MdomWZMDA--.15853S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUjkucUUUUU
X-Originating-IP: [2408:823d:2011:2f19:4657:e776:64ca:e2f2]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiThbJeGjH9Pex3wAAsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_043021_443667_A9304DAB 
X-CRM114-Status: UNSURE (   2.51  )
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



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
