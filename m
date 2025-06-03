Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0271C5AD49
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbZIOTBu8QKsOvZsEfNAKtWQD5QxVhLTwR1qcxmyf3M=; b=J6BK7qE7mw9bke
	QGt4KVmBz7Y6LDF7i1pAbhRgAKBNBuqNb5hbTsfp6BYcuy4i6LD6YT+xBvClq3BOKhM6Q3kfyxriO
	k5Py3EhCRRBv2tfqSfW3o0SLfAvYgsvLePk5iUH+VqFuXs6kasJ7r3nt7sLNkgGUPW3Uy2+CJt6Nl
	lRx8e/xVHwoiXDoa7x7fNLa2CHfwC/IHKfHRwXgsnDaGPK9IJo6ZZ1sFf+DKFVRokm42jB+p5PZgv
	4Mds3ChX2dSX+oxlxJoj4c27M21jayBWS4KmnP3+4WbDoUanYyUEfzU4QkWNnCxGTZEcvkFiso/fp
	xBHOKaYoh+QXHktI/iGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLwH-0000000A6zj-0yyM;
	Tue, 03 Jun 2025 07:20:01 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLql-0000000A5km-3v2L
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 07:14:21 +0000
Date: Tue, 3 Jun 2025 09:14:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748934856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=271pIvO6TV0rA+Jd4Usis7eXvzCSybFhiFB4KR/S7to=;
	b=p9h2De5kMe3kKRA/OQj44YMoWxPJzIZ6K7HgpqfRDIkPPoYxjY9HMB5lTZ1Se1OjAfcCHD
	2/aEMymiqqdxQp1zbKrUvaM2ltT2LqdSxVTTGuNuKTeC+OcAcLnBzyvsSJkF9ZgER2DQxK
	dEgDgBW/I+I47KFqKE75OPxNdAH1/nY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [PATCH 1/3] lib/riscv: export FWFT functions
Message-ID: <20250603-96ca9fbc275ae7cb68f8da49@orel>
References: <20250523075341.1355755-1-cleger@rivosinc.com>
 <20250523075341.1355755-2-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523075341.1355755-2-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_001420_143248_BC6CF0DF 
X-CRM114-Status: UNSURE (   7.56  )
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

On Fri, May 23, 2025 at 09:53:08AM +0200, Cl=E9ment L=E9ger wrote:
> These functions will probably be needed by other tests as well, expose
> them.

s/probably//

> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  lib/riscv/asm/sbi.h |  5 +++++
>  lib/riscv/sbi.c     | 20 ++++++++++++++++++
>  riscv/sbi-fwft.c    | 49 +++++++++++++--------------------------------
>  3 files changed, 39 insertions(+), 35 deletions(-)

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
