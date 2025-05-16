Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B32EC3ABC9
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 May 2025 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6msiYZXf8Aj+OknSJYsseQfBm4HR4OVrLbB2dXsH9g=; b=NFunOocCYzWqTJ
	M75oDJzY3HKpjDJ1SL1vcpn/HyK5svONXlUgupuMs7Nm1hCUSDwhDswdGSdXN+phgW9p9tVOL7zXG
	4I3o7yJntshHdaMCbP+GRfq/jaMtFe1DXDRyik/U5rFANQUNKz57/q/qCi0DI19XhyLfWHU4ZLdXP
	IcExAowqu8drykMrvZ5rA4kQEIVR3gul+8NKKPAFM39f9tbsr4F8zKBPH3F2BzzohTiz4Tm2QyGdH
	ibyyd0Nve7q7APwaQ4C+56JJg7Pdw1vEUttkcBoUoKTjeDMPBD5tXdc28M7dkbvtj79J3tHOKs2xh
	fEPXPLQdrtQJi9oaFRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwF0-00000003h9n-459W;
	Fri, 16 May 2025 14:40:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvWB-00000003aiP-1VKk
	for kvm-riscv@lists.infradead.org;
	Fri, 16 May 2025 13:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61DB6A4E81D;
	Fri, 16 May 2025 13:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2801C4CEE4;
	Fri, 16 May 2025 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747403670;
	bh=C7Ii4OS+lxxxizXe6a0Y+j3ekj3OuHIkNw86WOZShJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cP1EnUurIruml39wNmTO916nwYV+JYsFTfnPP4nmjkaih3cGNOdQ9z4N0TbXPE48V
	 zYmBC78TTb004+vCQE1NpvjKsIarFG4VohkLfJj6OiqAzaS8OZ28EXgDx0f0DrDa6h
	 1fNsWCOBqOuhZsjd4ADjabrCtgBEH/14EqvO0Vfn+datPh9GrRWBcgg3VicNv/0csM
	 ldMmmqXUbseIsffincpiS9ONc04q4SDM7QG65hs/WvPhdV3SG644WXYbgqh38S6ER4
	 3nISgaBqtAW5Km97OFt1D7bEVoH5+gg6NQd6GBw8kuTtzfu6oLlG4NBKBBoQDn0Ojh
	 /02Fxkf4SP4UQ==
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
Subject: Re: [kvmtool PATCH v3 00/10] Add SBI system suspend and cpu-type option
Date: Fri, 16 May 2025 14:54:24 +0100
Message-Id: <174740291953.2568869.1965604295335396910.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_065431_465287_9A019ACE 
X-CRM114-Status: UNSURE (   8.73  )
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

On Sat, 26 Apr 2025 16:33:37 +0530, Anup Patel wrote:
> This series does the following improvements:
> 1) Add Svvptc, Zabha, and Ziccrse extension support (PATCH2 to PATCH3)
> 2) Add SBI system suspend support (PATCH5 to PATCH6)
> 3) Add "--cpu-type" command-line option supporting "min" and "max"
>    CPU types where "max" is the default (PATCH8 to PATCH10)
> 
> These patches can also be found in the riscv_more_exts_round6_v3 branch
> at: https://github.com/avpatel/kvmtool.git
> 
> [...]

Applied to kvmtool (master), thanks!

(I updated the headers myself after fixing the script we have).

[02/10] riscv: Add Svvptc extension support
        https://git.kernel.org/will/kvmtool/c/a9880860d781
[03/10] riscv: Add Zabha extension support
        https://git.kernel.org/will/kvmtool/c/8be1c78896b4
[04/10] riscv: Add Ziccrse extension support
        https://git.kernel.org/will/kvmtool/c/0641ed8c3763
[05/10] riscv: Add SBI system suspend support
        https://git.kernel.org/will/kvmtool/c/fcc316016e9f
[06/10] riscv: Make system suspend time configurable
        https://git.kernel.org/will/kvmtool/c/1132ace1c069
[07/10] riscv: Fix no params with nodefault segfault
        https://git.kernel.org/will/kvmtool/c/b6e9f38b28c9
[08/10] riscv: Include single-letter extensions in isa_info_arr[]
        https://git.kernel.org/will/kvmtool/c/d47ad017c404
[09/10] riscv: Add cpu-type command-line option
        https://git.kernel.org/will/kvmtool/c/a50e8d888be8
[10/10] riscv: Allow including extensions in the min CPU type using command-line
        https://git.kernel.org/will/kvmtool/c/1117dbc8ceb2

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
