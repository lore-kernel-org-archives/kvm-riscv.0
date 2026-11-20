Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9BC606A60F
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hTYcqM7Y;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IUmdIXLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mIgecDKQ4fjLedGAA2vHTZdGAQY0V7t1lszvYH4z6HE=; b=hTYcqM7YQHQK5RUOo7PFjE93d+
	+uPfEVpAI9S8n0+P7nwR9cBicfwLtY+8+CtUThqUoUAWIeaQoxYtE6IUhB6F/Aw7PHLbagLTpAky6
	n7YnRNK5RA5mhnG88YaCyInQF48C/9MP0nR6kkJbFhkNmVPk48ERxnEe9nSX1EV2Xrsw0jmTP5x4A
	cyfxl3YoFGtReT6LwU7b3DXl+d8hswx0Y+UonKgpOPOELIcIO5GTBTVcBaUWH+mFQbGiZstiuuCn1
	VfLm0ypn34OXvQtsFK+0yPyL5WFVEioyEr1WJDG9gi/Y4Zm8YqbnfnHGJb/tbcg5IMJRoDugkXU3G
	0BlTgmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURkH-0000000FaCW-1k9q;
	Fri, 20 Nov 2026 16:45:53 +0000
Received: from out-105.mta1.migadu.com ([95.215.58.105] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURk7-0000000FaAy-49AX
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 16:45:48 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YDYRuiqu28FARVRycYUTo1yCu3WrQdKNTM4EinGTQu4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795193141; v=1; x=1795797941;
 b=IUmdIXLOLZJAcDHLhA6tijmSJT/IIjTV4JEhVpDYEe+W646jUacK2MwNXkRvdPJjCNlg9Vs9
 KhHiuN8cvLrGb1lxYd+nQlBxaLGPHo1a1mJhVYxiKjDNDRzm64Q+oQzDxu225AB3eDl/TfuyIN7
 R/kEaWOmKPS7ZQ2wHfzjxPrY=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 41424811bc9a0852;
	Fri, 20 Nov 2026 16:45:39 +0000
X-Mizu-Trace-ID: 41424811bc9a0852
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 17:45:09 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Koichiro Den <den@valinux.co.jp>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bingyu Xian <shanbeeyoo@gmail.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] RISC-V: KVM: Skip steal-time updates when run_delay
 is unchanged
Message-ID: <awB4BxCHBu6nacbO@orel>
References: <20261118062242.2914385-1-den@valinux.co.jp>
 <20261118062242.2914385-3-den@valinux.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118062242.2914385-3-den@valinux.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_084546_516387_20B6E723 
X-CRM114-Status: GOOD (  15.35  )
X-Spam-Score: -2.8 (--)
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

On Wed, Nov 18, 2026 at 03:22:42PM +0900, Koichiro Den wrote:
> Check run_delay against last_steal and skip the update if they match.
> This avoids accessing the SBI STA shared structure and marking its page
> dirty on vCPU loads with no new steal time to report.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  arch/riscv/kvm/vcpu_sbi_sta.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index cfc6f22c3e33..8b2499876fb4 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -31,7 +31,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  	__le32 sequence_le;
>  	__le64 steal_le;
>  	u32 sequence;
> -	u64 steal;
> +	u64 steal, run_delay;
>  	unsigned long hva;
>  	bool dirty = false, success = false;
>  	gfn_t gfn;
> @@ -52,6 +52,10 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  		return;
>  	}
>  
> +	run_delay = READ_ONCE(current->sched_info.run_delay);
> +	if (run_delay == last_steal)
> +		return;
> +

If we move the new check to just below the 'if (shmem == INVALID_GPA)'
check then we also avoid a memslot lookup.

>  	st = (struct sbi_sta_struct __user *)(hva + offset_in_page(shmem));
>  	might_fault();
>  	if (WARN_ON(!user_access_begin(st, sizeof(*st))))
> @@ -66,7 +70,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  	smp_wmb();
>  	unsafe_get_user(steal_le, &st->steal, update_sequence);
>  	steal = le64_to_cpu(steal_le);
> -	vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
> +	vcpu->arch.sta.last_steal = run_delay;
>  	steal += vcpu->arch.sta.last_steal - last_steal;
>  	unsafe_put_user(cpu_to_le64(steal), &st->steal, update_sequence);
>  	success = true;
> -- 
> 2.54.0
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
