Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6426606A320
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=opSWh3Kq;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bJNgXs/n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b4Vr9gzQC/3ABIBEtOwiACgELz1eizltTnh+1ZYB+ro=; b=opSWh3KqRrrsO8IepxsPsaF7Jx
	6D4qKnITRaxsTwqMpNPEK+rEPXAXOE3WUIcZRebumN4zX1sOFe4zcy575ZQKPo/aGR1WaNyiDYmKR
	yCFY9T6xKD4tOAAjTO0rfX3DgzW9uXMOYGbhCtHfFx7eHUfBwbzKCjFpRMbrCleEyXQI5PPWJ+oIF
	U1u+XIvKtxC8ao7ZmXSliw23mPkJGyONd4uLNO8MSI0fW/8dza26ioHDw+q/E+NhsXXBXDP9fLBe/
	7KUDQNybhYqylZp08wNmt3nwF2ahd86CfAD+rCm0qLqAwqLIwW+14YljMk5/OuKjwjqoymhvIAW2Q
	lxuhi2/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURfm-0000000FZoG-28W0;
	Fri, 20 Nov 2026 16:41:14 +0000
Received: from out-202.mta1.migadu.com ([95.215.58.202] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURfe-0000000FZmI-3iO1
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 16:41:12 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZoM2yf3MA8k5sZbw96Hh1V2kwRR1l1ZCz3uIHytu5jY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795192864; v=1; x=1795797664;
 b=bJNgXs/n1QT3IoJuJIbKvzdSmhhdwzylK2Sj7kxe2/0hHFFfJyWva9lJHMhWlt1dxYYqWpz4
 IB+fG3eztkt5lXlMnmK3H7g9/dIsemLKV5O99g6qXR6goFI5VLkjhu2I28PIbtErTczMU5ui1eo
 5rkqrgpOrrDhDpzG5McbIsbI=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 883b19b9dfbc7c0f;
	Fri, 20 Nov 2026 16:41:04 +0000
X-Mizu-Trace-ID: 883b19b9dfbc7c0f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 17:40:29 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Koichiro Den <den@valinux.co.jp>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bingyu Xian <shanbeeyoo@gmail.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] RISC-V: KVM: Batch user accesses when updating steal
 time
Message-ID: <awB1hZGh3LYztjqL@orel>
References: <20261118062242.2914385-1-den@valinux.co.jp>
 <20261118062242.2914385-2-den@valinux.co.jp>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118062242.2914385-2-den@valinux.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_084108_835173_506AB8DE 
X-CRM114-Status: GOOD (  20.05  )
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

On Wed, Nov 18, 2026 at 03:22:41PM +0900, Koichiro Den wrote:
> Updating the SBI STA shared structure performs 2x get_user() + 3x
> put_user() calls, each of which toggles sstatus.SUM.
> 
> Keep SUM enabled across all five accesses to the shared structure.
> 
> Note that write barriers are added to order the odd sequence store
> before the steal-time update and the even sequence store after it.

The barrier additions should probably be posted separately with a Fixes
tag.

> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
> To reviewers: please let me know if you'd prefer
> scoped_user_rw_access() here.
> 
>  arch/riscv/kvm/vcpu_sbi_sta.c | 59 ++++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index 60e50296a008..cfc6f22c3e33 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -8,13 +8,14 @@
>  #include <linux/kvm_host.h>
>  #include <linux/mm.h>
>  #include <linux/sizes.h>
> +#include <linux/uaccess.h>
>  
> +#include <asm/barrier.h>
>  #include <asm/bug.h>
>  #include <asm/current.h>
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/page.h>
>  #include <asm/sbi.h>
> -#include <asm/uaccess.h>
>  
>  static void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
>  {
> @@ -26,13 +27,13 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  {
>  	gpa_t shmem = vcpu->arch.sta.shmem;
>  	u64 last_steal = vcpu->arch.sta.last_steal;
> -	__le32 __user *sequence_ptr;
> -	__le64 __user *steal_ptr;
> +	struct sbi_sta_struct __user *st;
>  	__le32 sequence_le;
>  	__le64 steal_le;
>  	u32 sequence;
>  	u64 steal;
>  	unsigned long hva;
> +	bool dirty = false, success = false;
>  	gfn_t gfn;
>  
>  	if (shmem == INVALID_GPA)
> @@ -51,31 +52,39 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  		return;
>  	}
>  
> -	sequence_ptr = (__le32 __user *)(hva + offset_in_page(shmem) +
> -			       offsetof(struct sbi_sta_struct, sequence));
> -	steal_ptr = (__le64 __user *)(hva + offset_in_page(shmem) +
> -			    offsetof(struct sbi_sta_struct, steal));
> -
> -	if (WARN_ON(get_user(sequence_le, sequence_ptr)))
> -		return;
> -
> -	sequence = le32_to_cpu(sequence_le);
> -	sequence += 1;
> -
> -	if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
> +	st = (struct sbi_sta_struct __user *)(hva + offset_in_page(shmem));
> +	might_fault();

We're probably safe to drop this might_fault(). But either way it's fine.

> +	if (WARN_ON(!user_access_begin(st, sizeof(*st))))
>  		return;
>  
> -	if (!WARN_ON(get_user(steal_le, steal_ptr))) {
> -		steal = le64_to_cpu(steal_le);
> -		vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
> -		steal += vcpu->arch.sta.last_steal - last_steal;
> -		WARN_ON(put_user(cpu_to_le64(steal), steal_ptr));
> -	}
> -
> +	unsafe_get_user(sequence_le, &st->sequence, fault);
> +	sequence = le32_to_cpu(sequence_le) + 1;
> +	unsafe_put_user(cpu_to_le32(sequence), &st->sequence, fault);
> +	dirty = true;
> +
> +	/* Publish the odd sequence before updating stolen time. */
> +	smp_wmb();
> +	unsafe_get_user(steal_le, &st->steal, update_sequence);
> +	steal = le64_to_cpu(steal_le);
> +	vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
> +	steal += vcpu->arch.sta.last_steal - last_steal;
> +	unsafe_put_user(cpu_to_le64(steal), &st->steal, update_sequence);
> +	success = true;
> +
> +update_sequence:
> +	/* Publish stolen time before completing the update. */
> +	smp_wmb();
>  	sequence += 1;
> -	WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr));
> -
> -	kvm_vcpu_mark_page_dirty(vcpu, gfn);
> +	unsafe_put_user(cpu_to_le32(sequence), &st->sequence, fault);
> +	goto out;
> +
> +fault:
> +	success = false;
> +out:
> +	user_access_end();
> +	WARN_ON(!success);
> +	if (dirty)
> +		kvm_vcpu_mark_page_dirty(vcpu, gfn);
>  }
>  
>  static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
> -- 
> 2.54.0
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
