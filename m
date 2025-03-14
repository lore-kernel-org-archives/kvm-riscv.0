Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE83C35FF1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXsbBkNjiy9ZXMYinWq272a4ev1br+TmwPpkNgkA/Lo=; b=vn+PukgZaccqQM
	KCbshnusx83B9wBjf0gYa5bjGdDaLm/KQk0HFGIHCQeaLp5GLoG3mPCERscihtD+F9qPsHLsrKbvh
	YDCtsG+6LW8qSEqo9v+7MWA/ZdsQFiiDTb6xD4RXGE7P92g3R8yorBk/PFFHEJrbTcH7/577l3OF1
	1ze8I6Wb+y5VisvL8Y3/ID4jc3S4JolUg6vFOowgKliUktxNHwrmWpBp3lKTW7KngujcCh4cjofB1
	6xaPcLE30SXvd1UDYUs3NcC35vnx1CoMpV/xK6KLqdI/L7zKv4KX5HlOuNu526/GZw4TLQQmZKbgm
	Z6h960xFR5Ww8HUqOidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5tY-0000000EO9I-1tPT;
	Fri, 14 Mar 2025 14:20:16 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5tW-0000000EO89-1uIQ
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 14:20:15 +0000
Date: Fri, 14 Mar 2025 15:20:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741962010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GUcUJyznokWWPvm96+h7aNJY4n+o7HfWX5a4PXwb7DA=;
	b=mgJp4B7/U32G0Owl7o+mMXkEW1f1F9EFGic4ntY1bWtoF8pTrrjpZ2TqvpKDg0Y45SuqS1
	6b0ypbDQYDY5OWseTT7ArD6hV5dY/aDm5h4zPLdkwLJqHkYrqFMm0DFmECMwOrI/horsuK
	WXqLaMDC6JV/0bOGhyYW5UHrIp+aT60=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v9 6/6] riscv: sbi: Add SSE extension tests
Message-ID: <20250314-378268547f75d0337f1a7836@orel>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
 <20250314111030.3728671-7-cleger@rivosinc.com>
 <20250314-0940c2c0dcd92b285f43e4ca@orel>
 <56451a0e-7971-4619-8b2e-84c5129547b4@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56451a0e-7971-4619-8b2e-84c5129547b4@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_072014_639229_27DD7314 
X-CRM114-Status: UNSURE (   3.91  )
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

On Fri, Mar 14, 2025 at 03:13:07PM +0100, Cl=E9ment L=E9ger wrote:
...
> Missed it. I'll resend a V10 if you don't have any other comments.

Other comments are on the cover letter.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
