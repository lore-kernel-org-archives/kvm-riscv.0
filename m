Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7628ECA5FB1
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 11:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niTO3+uXtFXEpCsJ2Gu8JZ5TVQR8H3s83iuac8Hvs1U=; b=pqa0N+/3p9Fm3W
	FD0Ia569dxoGLTD1lcwjFA6P0j01k4qAYfWq4qS8gTjDTPWk5pd2Z/fws7XaGH4CkR5+lzV3svMLW
	zWK7qjaYEesut2SVxRBLe3569JOGLvy8ZgqdLSp+zLxbFb/Mx1sNZp8vsvZvlUtyQNCldIxclm9/p
	+7Ib8GEbE1ZXh5B3Vt4QzZG8oGfUld7Sii/hAzMCBHloGKbrbhnHOitma52Uw2aOA59/I4EGA3yMW
	pjM/OH+JylU6FILNWkJn0p/4Q2fcPk8tFEtkm2EnF5IYKGy0+qJjn0cUnilJY5L+U1TDo+r3ZkoQQ
	YkGgyCttrm7ND5kRaneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsYt-00000005sxw-01ck;
	Wed, 30 Sep 2026 11:33:23 +0000
Received: from out-103.mta0.migadu.com ([2001:41d0:1004:224b::67] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsYk-00000005sv2-04ca
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 11:33:18 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Fm5gGMCgIfeNDG/Bg80FSuuxecCyrNM0HlS/t4fTz2A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790767991; v=1; x=1791372791;
 b=SXTi5UvuV0WsY3MA4iUT5MfxTzTiXIXUp9SXjwZwzT7NO0kKNplkXAz6EdgZRVvGVx4NPYa+
 NJWXLjsv0WclYardy/7sQJbe1reAiMavhUjiwApTxj186oewokRsRwZT67nq62NrcXCqg7wTRGy
 VpRuHunnpKTeOSjkOASy7wyg=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 95fbaa6515cc444d;
	Wed, 30 Sep 2026 11:33:11 +0000
X-Mizu-Trace-ID: 95fbaa6515cc444d
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 13:33:10 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	opensbi@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH 2/2] riscv: dbtr: Add initial API corner
 case / error handling tests
Message-ID: <xpx2g5f6eadea73vbia7voxgwqj2snqyyftkcbs2sotre4b7z4@esewzeyddt5x>
References: <20260313050831.4016944-1-npiggin@gmail.com>
 <20260313050831.4016944-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313050831.4016944-2-npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_043316_371549_964A79A4 
X-CRM114-Status: GOOD (  11.96  )
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

On Fri, Mar 13, 2026 at 03:08:31PM +1000, Nicholas Piggin wrote:
> The SBI DBTR specification has quite detailed API requirements
> that are easy to get wrong. This implements the beginning of
> testing some corner cases, not with trigger behaviour but with
> API behaviour.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> These tests expose a bunch of major and minor errors in OpenSBI
> handling, for which I will post patches to the opensbi list. As
> well as possibly a bug in the SBI spec, reported here.
> 
> https://github.com/riscv-non-isa/riscv-sbi-doc/issues/257
> 
> Thanks,
> Nick
> ---
> ---
>  riscv/sbi-dbtr.c | 314 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 314 insertions(+)
>

Hi Nicholas,

Sorry I didn't pay attention to the OpenSBI and SBI spec work you've doing
related to these tests. Are the fixes in? Do these tests now match the
spec and the behavior of latest opensbi?

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
