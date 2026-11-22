Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B943F606A320
	for <kvm-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HQqygU6s;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lTGcvsZl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q7p2UotUK+VH4X+parafh/ByB7Uc84AHmsitfJ5mBEQ=; b=HQqygU6sgBSaxsKgqgTlRGGQxr
	tD4pSIA6oEiBrxuJ7TqCEF5EoK4J2aKeK3E0bPPid15QSCtNAhsY2z46u3ZKXMxdjpcEFRHU7PeYs
	BQ9gMMbhzxGfTTk5llvJWrAc4c0F1IRuy1Hs1dgU3EzDmGpT7Z4oEV9KbtEQmdx9ZUCxcTdTkrD4x
	EwA5YpmOnkNnv11Vz45PtIvDv/MQAFj3qkKQeUI9Bodu8VDjKQXAicbYEyLk4Adaft+B4zRADcNYC
	KSeEdpDcSN49Ggd21UTWKsUa4L1w0BmNc13+EXqADpqlQvQKF2lAlRHOQuOyALIJcdEHfTqUFbN6Q
	YCPyL3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6Db-000000013gu-1vik;
	Sun, 22 Nov 2026 11:58:51 +0000
Received: from out-106.mta0.migadu.com ([2001:41d0:1004:224b::6a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV6DX-000000013fH-2SKh
	for kvm-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 11:58:49 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ryWXKdGt6pMawUrYdr9GJQTC4h6r7TQ0FZPjcUKLboQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795348725; v=1; x=1795953525;
 b=lTGcvsZl2sArPgA+ta3CyzG47TBmyuWxJBWLP2MkHV5ctRQuXNbPB36oC1DAUckSqkj9ih2U
 jEHXxhZdwbb30nWZyTgHjm2ULCJ0B3dxwmld+4iPEW6WVJs/iUpC4X8tjzvlzmajETiuax4ePCm
 r3nT4z9X93D3qH9i00jxAKXE=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 61aa96329a398c95;
	Sun, 22 Nov 2026 11:58:45 +0000
X-Mizu-Trace-ID: 61aa96329a398c95
X-Migadu-Flow: FLOW_OUT
Date: Sun, 22 Nov 2026 12:58:10 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Koichiro Den <den@valinux.co.jp>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bingyu Xian <shanbeeyoo@gmail.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] RISC-V: KVM: Batch user accesses when updating
 steal time
Message-ID: <awLYx5ASZJLHDcpv@orel>
References: <20261121173526.892344-1-den@valinux.co.jp>
 <20261121173526.892344-3-den@valinux.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261121173526.892344-3-den@valinux.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_035848_306581_9E104B12 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 02:35:25AM +0900, Koichiro Den wrote:
> Updating the SBI STA shared structure performs 2x get_user() + 3x
> put_user() calls, each of which toggles sstatus.SUM.
> 
> Keep SUM enabled across all five accesses to the shared structure.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> Changes since v1:
>   - Drop might_fault(). (Andrew)
>   - Use scoped_user_rw_access(). (Andrew)
>   - Use le32_add_cpu() and le64_add_cpu() to avoid the extra temporaries.
> 
> Note:
>   - I haven't carried over Andrew's Reviewed-by since the scoped_
>     conversion reworks the fault paths. Would appreciate another look.
>   - As in v1, I kept WARN_ON() for uaccess failures.
> 
> v1: https://lore.kernel.org/r/20261118062242.2914385-2-den@valinux.co.jp/
> 
>  arch/riscv/kvm/vcpu_sbi_sta.c | 60 +++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
