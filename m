Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EA8CFD364
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 09:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4hPrLymELinpI0YEIYAqEB96vyQLeifbms3OMXYajg=; b=X+qWxFtogZweRj
	2LbHsVpVt3Kreund6tjwMjdh0bu1QstXGR2Jr7vOv+lOjyL6pisjUGTuTvUgp9ZpEoVDNuQTctGLq
	6qmQRRyq5q7zIXlx9E4ym06LrrcEC++aZoOqSYXQvV7rBvkhB+3q7dESpYUDcwwhRRTedrGgkBsDT
	Lmvxo5SOqxOo34mad4VycbMMClyC7LCpvIbdynfaOMO/qObFjHdCf6YJZjtUgGzcna3mVduXVF+5m
	VP+4fvsKr8vFkiHl0ZYhIdYmI3IUhfJ4oq30r51/zeoGr9rpRdbaxX9zHLN/CioDkaQx8XcE5hNyq
	ubc5OsFLjOwVocln31+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNphH-0000000D2xB-1GpH;
	Tue, 25 Nov 2025 09:50:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNphE-0000000D2wi-20lM;
	Tue, 25 Nov 2025 09:50:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5109643A5C;
	Tue, 25 Nov 2025 09:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F13BC4CEF1;
	Tue, 25 Nov 2025 09:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764064251;
	bh=ZpZ7Gn9GLkQYXGHbd52ia/vfx8XpDdhT9cEzlscmjek=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YQ3TY/wNjqodeZHs7cE5lAYdvVZ23Fk0Y3iJU+nqRkQWEwN1q2k5fFzjwd8uM381Z
	 t/Kit8WUH7idwZdNOPhAI1oZUmyQBAVSrWq2dwIiZDn6okk2bd+6GbU+zmlPhlhva0
	 21EikZ0Rgdiz8jg8xj2uWPn0SqzW8Uy4TXOVHuEMf3QNiXxThyJ9Evwr6e5nUik/eV
	 sG5HT5RmS98jBKN8HeKtVb6SL0sq6jCkUNEOpMhiv8jufsbqDQpqWlf9dDfxlZ+vjM
	 Pwicdetk7YIZ3BF4huugAu/dM1N1xA/Qz44hIwEXzwQ2gRKja2j7C5deCLw0L59icH
	 hFVqBmVLRX5jg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0513A8D142;
	Tue, 25 Nov 2025 09:50:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/5] Add Zilsd/Zclsd support in hwprobe and KVM
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176406421375.657800.9856634072172881689.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 09:50:13 +0000
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, anup@brainfault.org,
 pbonzini@redhat.com, shuah@kernel.org, cyan.yang@sifive.com,
 cleger@rivosinc.com, charlie@rivosinc.com, cuiyunhui@bytedance.com,
 samuel.holland@sifive.com, namcao@linutronix.de, jesse@rivosinc.com,
 inochiama@gmail.com, yongxuan.wang@sifive.com, ajones@ventanamicro.com,
 parri.andrea@gmail.com, mikisabate@gmail.com, yikming2222@gmail.com,
 thomas.weissschuh@linutronix.de, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_015052_563212_DAEB7D0E 
X-CRM114-Status: GOOD (  10.54  )
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

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Wed, 27 Aug 2025 00:29:34 +0800 you wrote:
> Hi all,
> 
> This is v2 of a short series that adds kernel support for the ratified
> Zilsd (Load/Store pair) and Zclsd (Compressed Load/Store pair) RISC-V
> ISA extensions. The series enables kernel-side exposure so user-space
> (for example glibc) can detect and use these extensions via hwprobe and
> runtime checks.
> 
> [...]

Here is the summary with links:
  - [v2,1/5] dt-bindings: riscv: add Zilsd and Zclsd extension descriptions
    https://git.kernel.org/riscv/c/aeec6a5ddd8a
  - [v2,2/5] riscv: add ISA extension parsing for Zilsd and Zclsd
    https://git.kernel.org/riscv/c/ac3b03f8a4eb
  - [v2,3/5] riscv: hwprobe: export Zilsd and Zclsd ISA extensions
    https://git.kernel.org/riscv/c/668a3bd57466
  - [v2,4/5] riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
    (no matching commit)
  - [v2,5/5] KVM: riscv: selftests: add Zilsd and Zclsd extension to get-reg-list test
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
