Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BA0CAC592
	for <kvm-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 02:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	Message-Id:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IKd78Uci3TwMhB0CTSRynXM9liCnXSvujqDsKP5YZRI=; b=hfiq3ThSzmcGY3
	bRH5OSggJnCNB5m1sW9pspC5BV3MKnp8xdJEqJaR4ZcnszgvYx5uy8ya5IEXkIPvG8OiIBT7bxPyL
	OfazRuk7W2e1v5QImofIFVz1VDZlmEsrxEWZefF6Eo2pdNiji9FQwbltwAi0hLuBoyE1h5oUlEXND
	un/7Mn2Lg3vBfuX3NNN3VRZa2r1kurlwVAeGes86zR+xcJJwTQ0QTkAN7SrBJJVxtYBNh7NA0qtK6
	Z8wHthR9WWpL8xFIP0iH5ntFihSuSCHXdXypRzsbHItZ4ujexq07qoTujgVaZYImump6Ir8V8PuWg
	9z4WKtvj6iT9msC2J8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyi01-00000009yep-3qn8;
	Wed, 17 Sep 2025 02:34:25 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyhzy-00000009yYk-3FkW
	for kvm-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 02:34:24 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4cRNBW6Zkbz8Xs72
	for <kvm-riscv@lists.infradead.org>; Wed, 17 Sep 2025 10:34:11 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 58H2YCma081344
	for <kvm-riscv@lists.infradead.org>; Wed, 17 Sep 2025 10:34:12 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Message-Id: <202509170234.58H2YCma081344@mse-fl2.zte.com.cn>
Received: from njy2app03.zte.com.cn ([10.40.13.14])
	by mse-fl2.zte.com.cn with SMTP id 58H2B4mv051151
	for <kvm-riscv@lists.infradead.org>; Wed, 17 Sep 2025 10:11:04 +0800 (+08)
	(envelope-from wu.fei9@sanechips.com.cn)
Received: from mapi (njb2app06[null])
	by mapi (Zmail) with MAPI id mid204;
	Wed, 17 Sep 2025 10:11:05 +0800 (CST)
Date: Wed, 17 Sep 2025 10:11:05 +0800 (CST)
X-Zmail-TransId: 2afe68ca18b91e3-00774
X-Mailer: Zmail v1.0
Mime-Version: 1.0
From: <wu.fei9@sanechips.com.cn>
To: <kvm-riscv@lists.infradead.org>
Subject: =?UTF-8?B?S1ZNOiByaXNjdjogc2VsZnRlc3RzOiBzdjM5IHN1cHBvcnQgbmVlZGVkP8Kg?=
X-MAIL: mse-fl2.zte.com.cn 58H2YCma081344
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: sanechips.com.cn
X-ENVELOPE-SENDER: wu.fei9@sanechips.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 17 Sep 2025 10:34:11 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68CA1E23.000/4cRNBW6Zkbz8Xs72
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_193422_965525_D740BA7D 
X-CRM114-Status: UNSURE (   3.56  )
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

I was running kvm selftests on qemu-system-riscv64 with "-cpu rva23s64", which
uses sv39 by default, then I got the following error. After some debugging I
found sv39 is not supported for selftests, should we add sv39 support? I can
prepare a patch if it's needed.

# ./arch_timer
Random seed: 0x6b8b4567
==== Test Assertion Failure ====
  arch_timer.c:73: false
  pid=144 tid=146 errno=0 - Success

Regards,
Fei.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
