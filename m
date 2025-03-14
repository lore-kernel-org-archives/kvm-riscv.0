Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46501C35FF1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQqb0r2BqCBQ9E49aThnhHFDmdeLRteNwjA14o37Ymg=; b=R8+qfmnYVb+Zwd
	kilWjtbeyHb6vMnrB+4o7hmv2ccrrVBFsHY+I/Fm1iijLjxLMEVXnSJltIPgcp+qh2KwQj0hUXaap
	AwH+V8ew/f6N/rJJ0SK/rCnVdUxB3hahkjXL6ww8MS4YGLYUv8j6W4lPvmvTtaciCX+9hQsmiUVd6
	7XxAnYWlE2HlabHxvVWiDka+P+59VTCcQzPCpnvTDFXsATUI/AbVnxc1FxpkErhcUemfbak/ogdiG
	MSACj+MbbwgRUDftBzWw9dWtXMArLsNIKQpNXFjm9Qd5EitwAWIxQcNWVsJiQjCfvwQtCf/WVpZky
	xwbDyzp9d0XHJMQX1gMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5si-0000000ENzw-3i7P;
	Fri, 14 Mar 2025 14:19:24 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5sg-0000000ENyQ-1Mt0
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 14:19:23 +0000
Date: Fri, 14 Mar 2025 15:19:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741961960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rfm2SHJGPzpJqmbjHZGEFvTtcDzNAo8vTHZ0TBp3tm8=;
	b=G+QwETGZPF4lpBTabTVHn1zefczMYLL6dFG3+c/eMhXR7n0U3UBekW0yg0x32f4eGA1wHt
	WgjMjzrkcmE29qWfRBYBeqmyPDCct3uTmOChsyyikhgwLuWF/ugadzKU5He9E1tVfiz4A6
	wRh2EBQsY2YPY4tMDxxTuBIivrX3pD8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v9 0/6] riscv: add SBI SSE extension tests
Message-ID: <20250314-eb8cf0b719942c912e254ab2@orel>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314111030.3728671-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_071922_501607_EA78B5BF 
X-CRM114-Status: UNSURE (   7.53  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 14, 2025 at 12:10:23PM +0100, Cl=E9ment L=E9ger wrote:
> This series adds tests for SBI SSE extension as well as needed
> infrastructure for SSE support. It also adds test specific asm-offsets
> generation to use custom OFFSET and DEFINE from the test directory.

Is there an opensbi branch I should be using to test this? There are
currently 54 failures reported with opensbi's master branch, and, with
opensbi v1.5.1, which is the version provided by qemu's master branch,
I get a crash which leads to a recursive stack walk. The crash occurs
in what I'm guessing is sbi_sse_inject() by the last successful output.

I can't merge this without it skipping/kfailing with qemu's opensbi,
otherwise it'll fail CI. We could change CI to be more tolerant, but I'd
rather use kfail instead, and of course not crash.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
