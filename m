Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAB1C87FCF
	for <kvm-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=potG4JFNoiWylkYRhnCxi8drdfn1Bb0bWK7un+6h5nw=; b=Wu+g6bBMIrHQlt
	+4KGSad8QiFQPDoKX5OokS2eH0BBR11ppMySFs22XDsxqKnmqcgGPEcdREifb1+DpOt047c4NfdZb
	kCD6hpQTYMeqXWbui0rDpp30DrNAeZ47vxxI4VFAW4lI3AnenyqO42n22PFhwSzfprEuuWFzgmyhX
	fJF9fNjr6FSMNz3K+R4/sY286wnYA3zkrfZ2QhNSDaDpdoRpdvv1IHMIHcpwc0tRH81OEE6VjfM2w
	ayKzIG+d+RPXjKXvc36DX+fkrIpc/5h3sR/Y5QBG8a9M469Q3oVJxNv0eX0/Xlc+mzgucgor6/KNw
	arqSYrq/juWRYe1Mun0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDpU-0000000641c-1DFG;
	Sun, 10 Aug 2025 21:43:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDmP-000000063PB-0hZD;
	Sun, 10 Aug 2025 21:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XMHVf/CZyz5eXVzs+1kxU50uJMZZqDPie91mH2VeSS8=; b=Rf2zDA0vlh0qq5AwYdSm8P6PiM
	1CAHE6qjCRR2Mg9asGy5h9obgryVWONyqTycv6/EjZDhIAG7Q/OoMK2ahbh/XXvv5Zib2K0RyY9CP
	H+wKCpxReK5BEWrq9dcWMMyjc6GpaQOcUtvLkwcB/iKBbOvOTrbnn8zXVD5WpDUEnQi/xMJYKP8oo
	ngQZ4kShubyvCd+3AB9kCVojEQF4NXwPYWW9shO9pufTJP0Qlqgsj+c8nQx+0ejZKBfjPX4FReRVy
	fWn3cWJ3R3wJpNKinI59A8CjO1MhQq54Ad209LvX7NuNnUDXaDXB43kqVinfjjHZ61O2qGJmdAe50
	Y7trKZ5A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDmL-0000000FIR7-3fnk;
	Sun, 10 Aug 2025 21:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FE6D449A6;
	Sun, 10 Aug 2025 21:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB85EC4CEEB;
	Sun, 10 Aug 2025 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754862029;
	bh=Fijcsa/lBkF0yn2nOI1I1ALk4S3Ym5/9LXKLrjvgt4M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Uv6lCp66svp6z1/9IMgCByLzV5cnx+AfDqNGD1mYntQilkGFkXGWkPo8bcuhuT6t9
	 Wl4NHBITEOhqOY8omlGfspSMbQXkhLm8VnaWSNLsMe3BzTv9SeoOxqHtMMHztIbKM9
	 CiftrrHFRkJm2dqb+XlcF54SDDl9bjK2pwcqvec/i+jmUthJFd8W+T2/NXzXa2z02c
	 +f93TpkJNjjDhRxrBbo97SJFs0xiyeOua9gPrbO7pGJcRlaNYKSUdz+FmlnsbC5x78
	 BJDEF9ZKqpEauUnibMWf9E6fCOMmBcxbZUimUDvdjMzmzPumuN44gzxelt5RJ1+u7e
	 aFPPfjZNHuCvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCDE39D0C2B;
	Sun, 10 Aug 2025 21:40:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL v2] KVM/riscv changes for 6.17
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486204250.1221929.3641072096313977215.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:40:42 +0000
References: <CAAhSdy1084USuM+k9T-AP7X_=s7x+WFv++U0PkjVojbPbjRCrw@mail.gmail.com>
In-Reply-To: <CAAhSdy1084USuM+k9T-AP7X_=s7x+WFv++U0PkjVojbPbjRCrw@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 ajones@ventanamicro.com, atishp@rivosinc.com, atish.patra@linux.dev,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_224034_212410_FC666490 
X-CRM114-Status: UNSURE (   7.33  )
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

Hello:

This pull request was applied to riscv/linux.git (for-next)
by Paolo Bonzini <pbonzini@redhat.com>:

On Tue, 29 Jul 2025 17:04:22 +0530 you wrote:
> Hi Paolo,
> 
> We have the following KVM RISC-V changes for 6.17:
> 1) Enabled ring-based dirty memory tracking
> 2) Improved "perf kvm stat" to report interrupt events
> 3) Delegate illegal instruction trap to VS-mode
> 4) MMU related improvements for KVM RISC-V for the
>     upcoming nested virtualization support
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] KVM/riscv changes for 6.17
    https://git.kernel.org/riscv/c/65164fd0f6b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
