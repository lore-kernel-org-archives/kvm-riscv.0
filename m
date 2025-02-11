Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED08C0219B
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFrcNe0TVXd/O23KrH7g1c5+CSNpd4HJwdSTpIyNgiE=; b=gtoBQBd3E4evo2
	yFwraTQXUI6Zu7m+osm8OSipqFzHGeZQEql3o2526pNQulJORZTrA9r5jr/XHhYert8kwtuMbRE7g
	TEevptQ6ebHpXLs3HA4PFSXSD3ffp+CgQJ+1Tz0cga/XmHnLQxN57lDMU/QAnDf9I0YWnM3SIcs+2
	4evodz2bsYw6SwGOEGpYqY1zIqkMOACdDZVtCvrr1kAG4A2g+Q5HcNCInQ2PL6bsro8L4ZuERXYCZ
	KzWoQcafl12x0mxCW1fzcPTn1fbZxpUUPQDoSM/iIbz9m/j7eOGzqB7OnNCQP/8GEQ09H4Y7OdUai
	FRfPaKxp4z2P8bpyyRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpgb-00000003pYE-2l3Q;
	Tue, 11 Feb 2025 12:48:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thosC-00000003fBf-2Hlr
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 11:56:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D7955C1190;
	Tue, 11 Feb 2025 11:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92948C4CEE7;
	Tue, 11 Feb 2025 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739274975;
	bh=xQFncEgm4QJRIBcVzR93emAbbAi8gnk+uobjJ7Y5FtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRzqGU/PQIxfEkivwenbNB8hMvE//41JrqzmZl6+XhV1N3zim8tIYr9IdKQ/1nznj
	 kr+1rZKA/8x4JdEtcbVQipqiERGUab6or9NiTt4/gBTnLUWYyPsvfUBENpvgEdTZlm
	 sQWuqb8VXVkXylJFL9skuGw3eaKbdzLvKsaJVOSF4srxyn8tjkGep6r85lwHVCnI9/
	 FOAq8HGTizW+UqSGf/RJSE/FyZgXl+s3YKTtzkNvY6NMSRkU/xD/JNEvvSrph7aAj7
	 l9C/CjAjTc11izWd+2TczK6Uug2va6YF6ZKJYiKakBEWzO/LxTNsKINsXiCDk6E5c/
	 yUt1itSqrjkNg==
From: Will Deacon <will@kernel.org>
To: julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 0/6] Add RISC-V ISA extensions based on Linux-6.13
Date: Tue, 11 Feb 2025 11:56:07 +0000
Message-Id: <173927413245.2100000.2379153198496895736.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250127132424.339957-1-apatel@ventanamicro.com>
References: <20250127132424.339957-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_035616_633935_B4E71C06 
X-CRM114-Status: UNSURE (   8.26  )
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

On Mon, 27 Jan 2025 18:54:18 +0530, Anup Patel wrote:
> This series adds support for new ISA extensions based on Linux-6.13
> namely: Svade, Svadu, Smnpm, and Ssnpm.
> 
> These patches can also be found in the riscv_more_exts_round5_v1 branch
> at: https://github.com/avpatel/kvmtool.git
> 
> Anup Patel (6):
>   Sync-up headers with Linux-6.13 kernel
>   Add __KERNEL_DIV_ROUND_UP() macro
>   riscv: Add Svade extension support
>   riscv: Add Svadu extension support
>   riscv: Add Smnpm extension support
>   riscv: Add Ssnpm extension support
> 
> [...]

Applied to kvmtool (master), thanks!

[1/6] Sync-up headers with Linux-6.13 kernel
      https://git.kernel.org/will/kvmtool/c/4b2cc0660ef3
[2/6] Add __KERNEL_DIV_ROUND_UP() macro
      https://git.kernel.org/will/kvmtool/c/66567918472f
[3/6] riscv: Add Svade extension support
      https://git.kernel.org/will/kvmtool/c/f8ed03217263
[4/6] riscv: Add Svadu extension support
      https://git.kernel.org/will/kvmtool/c/521b1b676e5c
[5/6] riscv: Add Smnpm extension support
      https://git.kernel.org/will/kvmtool/c/4489348c961b
[6/6] riscv: Add Ssnpm extension support
      https://git.kernel.org/will/kvmtool/c/e48563f5c4a4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
