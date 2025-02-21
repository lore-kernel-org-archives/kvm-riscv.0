Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF80C021B3
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iYJvXg6787S7zBXqdUejg5JLy74O9gFvsskc7qGG75k=; b=VdGcXrPjwjbK9v
	s2F6PN+e+FKUzRQrMb8ulE0z4+9UGnR/3qW3YhAF7fv5484o/4Izzmxc02RdqDTijoKIv0Dc6RP1l
	F5Ww0SxCAUryJbVKtVwAKm2ycOjNDf3IM8Sc1mc5uvuf8X6rVSjs6OGdvCSKAYfEFwumtxAjaMWTY
	q2hnoUQv/dLjzReDpk7NBTeRoULhvEhp68pYKhuZHwsLBvAOWIybJwSS1IWXo0kkj4dtSzTqbu5SV
	RMNN+I/Mct0sHN8GPBBIP1NNVMJmzJPF4M4Gy4OXPJZceBKolYpbiNGLxYH22QB8EaAAKxhT07pW4
	VJNjT7u2IBXVMlCvH1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVwR-00000006Bxq-0ViR;
	Fri, 21 Feb 2025 16:31:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVso-00000006BHl-1hFk
	for kvm-riscv@bombadil.infradead.org;
	Fri, 21 Feb 2025 16:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=nvihCTLUnpjmg13KE8NiIArlIRl2NHcMe9sLvn5Y8Zc=; b=X19RPmgRuGtlpv8NeHsO2ZZW5a
	k8uF3JNyjYsfuqxI7paC5a+OaQqFZTtyzX9q88bZMuhXFDkD3EmE5rYJUQxgAXS8O1tbjOi/lFw/A
	ubyf5JusSdPTOvWb5gMLz/qebYNhSqmy1KlPDpzlt9dkJiCZvSH3oBgHWFSrRCdvi5V0ChTwq69nA
	Abpt8tUqR72+6f9SmohfpvwfH+jZ1Fyzd4Vwh9ZVSW45u7DNYp+BEqHlvpAiiXcUIhYMbjkCaiVB3
	hLFJbOcWpS1/zXWIEvM4ov8hY63wsAjtHSyjWXvYDTxgi49elhzk785tYTAVgA8/Pi9Xwr1UVUhQ5
	bzVWpZIQ==;
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVsl-00000002gBU-20yF
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 16:28:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740155277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nvihCTLUnpjmg13KE8NiIArlIRl2NHcMe9sLvn5Y8Zc=;
	b=D828hQ75x7LcOdaHJUuv76LZ+nhQ8J8i5aSAy56h5icG2a3z371jSsXKTo/xvKiOMfb03n
	+n5E3c5bSCajtQAXd17J+nj4FAGLlOTFGxjBu1nKXL1xxRFVF3WoIyo/cEpDFsrYEqfKlV
	O/MyDN77kIR7K5XqOhTjQ58Vd911NTI=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	atishp@rivosinc.com,
	cleger@rivosinc.com,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH 0/2] riscv: Run with other QEMU models
Date: Fri, 21 Feb 2025 17:27:54 +0100
Message-ID: <20250221162753.126290-4-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_162807_733322_2BD2B08A 
X-CRM114-Status: UNSURE (   4.69  )
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

Provide a couple patches allowing a QEMU machine model other than 'virt'
to be used. We just need to be able to override 'virt' in the command
line and it's also nice to be able to specify a different UART address
for any early (pre DT parsing) outputs. 

Andrew Jones (2):
  configure: Allow earlycon for all architectures
  riscv: Introduce MACHINE_OVERRIDE

 configure | 88 +++++++++++++++++++++++++++----------------------------
 riscv/run |  6 ++--
 2 files changed, 47 insertions(+), 47 deletions(-)

-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
