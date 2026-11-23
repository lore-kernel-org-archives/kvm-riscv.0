Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A15E606A31A
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VRnD+1AW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NjjMBlVp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PUDwd8gHHzdzE/9G5+2Z354f5SAv9YRBybCAxoZc7ys=; b=VRnD+1AWeNWxDKt77sAhbkRnMh
	Ij5evikDH0P490vEXwJihxD9ab1AXH2o8sg91mcSv0MMZuAkStbNL4R00la4MA3TDBrYuZDHgVNBM
	KO+itIwNuFeHvwyWNT7j7Bq4wH0DGm8/JtqaWhN3s6SgUqkaibEyxZu3EQFXq2AJ0can0OI9fFzkZ
	W903YV62Zmp6X4bxhY6VzOPytxbyiFx5W6rkx4QazaaCx2FHhyNRRnCiGtCsiyMwU9pCB99ngn8xN
	BWIgyAQtgHDtNZ6yIbXFVwyUMhRJ7y0DBeKr4L01DvkoXVrJkm2Y4cDcdRxGry5ydaphoCTPvGesz
	Bd803ctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTEW-00000003N8R-44XD;
	Mon, 23 Nov 2026 12:33:20 +0000
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTES-00000003N6y-2ffa
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 12:33:19 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3b14c80b210so706412a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Nov 2026 04:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437195; x=1796041995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hn7QLnatls3YJLh9hvARkpylGvnCInTwrPxLQjvpHck=;
        b=NjjMBlVp8UNMstdcW0Od9UJg4lxK96kWkGYtbXa5qj0ivKQywY4F9w8iIPDaVYoLQ6
         eXZ9ENwAvgTKR4RW/4zRU0I1rZUS1rvO5kkMCjXilcMiTMCZyzsrCa3W2TnXSe1wXdvz
         lVMJJ4wM0IpG7O33p6onUYqoT/5QP+VTeql6r59z+WAi+RNzR/rsDFt9xUkbN/pcF0wv
         4aF6EODQzIcSyHja/CxF4rdiRZlr7gpZCg2iCfpN4LY/Kf0wR8P1w9TIeb1rsUF5dn9j
         Yc0H9KJ0W8s54LEPA/RPj1lkHND8tConu+hSZva9rgl+ZMpZVTVez6hp5IU9uOHiSdLq
         rVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437195; x=1796041995;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hn7QLnatls3YJLh9hvARkpylGvnCInTwrPxLQjvpHck=;
        b=KQ+VfpFbY8KOQw2IXTRD3o8YWx9/T2l2RWerRvsD8FcjJOR/bsPsVEE7Qd9LgWkNhB
         yEdjm7wrlhh1EqI4B9cwL6c388KYUX6Sa6Cds8BsWzJFRKJyhjlSUQKLzUcFwmSwY0JW
         CxT5arEr91brXXt7obWvgG0++ZrWc213X73H/kUJZ9huPN+b1PGmQsWKfxvGbEUjoDJ6
         N9lWptm0LwPJhjshfovJB7fqxJvZbCR35wc9EoNvK2UEDXtGtyp0ht6graYL55imVJIN
         YSGIkCNR7kXeYWczSXJxaK5cQux5kIVV5/LTcZP27jcQ6jUu8zRAMDwYiATHnngo5u7k
         fXmg==
X-Forwarded-Encrypted: i=1; AL+hErGwvTB32dgxvSKowG3ibHTs+mnerZ48JriM+t+2EYt6lTvVclHFQ0wLAgYlhTtJkGdzI/xg/vh3mfs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+td2hesiJjDP6qpiLGQ7swp0LXwBSZedPZjHGkJOvZ9qb3uLJd
	fc5SCAdWmDl6l0jN4mhfm7MaVrpYU6YhMWr0S9Lnq1V8fjrl5p0KE33r
X-Gm-Gg: AZFdTZdm5V+tjugj+F8S42NDTvp9+3QDyo5IwtzENyzCr5PIft2l9x3YLskpSj5Z9gd
	lgowCzOG3XH4Al5R5IPqHpJ+LhV3Unko75ll3FfB6n5/wAeq3/R5TgWACPHbxwAG/Xl9xOUFybv
	hqURTY6BrRMitsPlGqz44saJrQgySz7aZRezV4KmlvA3xaxxbIPA9WWn3vMI0GebQSocqM41LBt
	4psTmZzRj8ER9eUxBfGyzpdwzK0JX8aufdj+YJV97H2GAlBVrCJls/iJR+iz4unA6eiPGUk9Lqj
	UZ1KqAReS2pMjFRu6A/aRxS8tvi2eAeoygvbADiKcYrly6hd+RtwWYYeIewo/UjMiz3cQ9gT2DO
	W1q8qF5UixQDAg77HAm0fbTm8tj/lsgCGZmwyPyYXOYBmb9nQQukwxzq5eFlU3dTqclN0SHENQx
	l/yEZ5yyKvH0N4CGXia9ivQUSoE+aiYPC3SSRdgSqRKVy7m/B23r8Sj/f8WlliVP52RB7BfbXNg
	RaKjOrSMboy5FVTKcjxdwfISY7znmNTo1o1JUn/7xEwRj8OvsiBlSgXDKDu62nKGvo24gjkdCe0
	6aYLE/sIlgj705lD3JBXdtHlkEDd97Vbl26O5BZTbcWievbN
X-Received: by 2002:a17:90b:268f:b0:3b3:afdc:2e5 with SMTP id 98e67ed59e1d1-3b41c9cf56bmr7964160a91.30.1795437195128;
        Mon, 23 Nov 2026 04:33:15 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm7472471a91.0.2026.11.23.04.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:33:14 -0800 (PST)
Message-ID: <4ac66d3b-7343-4ff8-8ebe-d3bf9ab25da4@gmail.com>
Date: Mon, 23 Nov 2026 20:33:04 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 05/10] iommu/riscv: Add nested domain allocation
To: Andrew Jones <andrew.jones@linux.dev>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Tomasz Jeznach <tomasz.jeznach@linux.dev>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, Tan Chi
 <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
 Zhao Qingye <zhao.qingye@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
 <20261119132744.396426-6-gong.shuai@sanechips.com.cn> <awGP5H2JdjxW8WXG@orel>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <awGP5H2JdjxW8WXG@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_043318_207913_4104C311 
X-CRM114-Status: GOOD (  16.12  )
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

On 11/21/2026 8:37 PM, Andrew Jones wrote:
> On Thu, Nov 19, 2026 at 09:27:39PM +0800, Gong Shuai wrote:
>> From: Wu Fei <wu.fei9@sanechips.com.cn>
>> 
>> A nested domain describes two-stage translation through guest and
>> host page tables. Iommufd exposes this domain as a nested hwpt.
>> 
>> User space needs to provide the guest stage 1 configuration when
>> allocating a nested hwpt. Validate the configuration before storing
>> it for use in a physical device context.
>> 
>> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
>> Co-developed-by: Gong Shuai <gong.shuai@sanechips.com.cn>
>> Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
>> ---
>>  drivers/iommu/riscv/iommu.c | 153 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 153 insertions(+)
>> 
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index f2305b953f71..4f8ce579ef08 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -1698,8 +1698,161 @@ static void riscv_viommu_destroy(struct iommufd_viommu *viommu)
>>  	ida_free(&riscv_iommu_gscids, rv_viommu->gscid);
>>  }
>>  
>> +struct riscv_iommu_nested_domain {
>> +	struct iommu_domain domain;
>> +	struct riscv_viommu *viommu;
>> +
>> +	u64 tc;
>> +	u64 ta;
>> +	u64 iosatp;
>> +};
>> +
>> +#define to_riscv_iommu_nested_domain(domain) \
>> +	container_of(domain, struct riscv_iommu_nested_domain, domain)
>> +
> 
> Please rename the macro parameter so it doesn't collide with the domain
> member name, otherwise macro expansion replaces the member name too.

Thanks for catching this, silly mistake on my part:)
I'll rename it in the next version.

Best regards,
Shuai

> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
