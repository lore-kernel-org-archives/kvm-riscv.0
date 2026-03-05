Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5266BF3D33C
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qZ6FJTAbyNzX4KvUi+iAm4GstvtaMNm/DgtiEQTo8TI=; b=Bi4fY/Im1pmuioiAFxdAumGGKw
	b6cl21evOYa0S9bDGroryjh2l4TyVrjYtQkxVw42ghfPVz898B62PeOPHfIuurT2lUtsJVWA6qtlQ
	kBJ5D342bx6E81PqymRJaPqWY794foeOVAKXbTOsru3Uk8ZrqgpAZR7LbD8yXawuxh7okpNSQH0x8
	yWc42uwkbh1tFpOnXETIlAxYNWnOv87qSWdilG9Pf7aYTFvZLM8iMc0Sr5kgWc8OnMVpHumVC0b5v
	kGbhf/ab73KsRoj9+GFuZbt0KXo5gY284vyFQTKPvsTXrQfBZdVpvf6x4yr7xqgUXQrr7+EoJcYHn
	GcZKeymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCMO-00000002HHT-3wiP;
	Thu, 05 Mar 2026 17:19:40 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCMM-00000002HFD-0HSg
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 17:19:39 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-8299499d587so144575b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Mar 2026 09:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731176; x=1773335976; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvL7QI7vtAV/elV7wuwJjb0ouQ5MS/0W571Ri2ejdh8=;
        b=U+/NFEkOWE9jZ0bM1oY079L2ahCo07sLfRKa8o+CYugD3fwHz4jLi3hosu/GwioO3z
         Cu0Rf+oZdtDq0iaagNRnQCNw6ayYeSXbIG02mosII2OUI3lMgZkf18a/smDNNbiD1uxn
         Zhr0v5UOjMRzgo/Fn7yuHbdP0+hREaXskn5oFdc7an2+gW633W5jba3qXPuKW0YEUfWb
         ZEu+r3KDnjJOC44Aq9op2OvP5ADMCWhmfjcXdz2/JBIVvA6MSuHF5MCUnxAnVVpM4JAg
         b0KM5NgRBO690pF6g/E6LH7gczk4VcwiSRnDVnwTcRuBK0DM9M6OtU7oH80nzutnjeZ1
         H7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731176; x=1773335976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvL7QI7vtAV/elV7wuwJjb0ouQ5MS/0W571Ri2ejdh8=;
        b=Tta8HeSooYV41rUCQLLAR+8JSKHERnSxyCyAOhGY5ib0Gt7zDATaMdg1jy2YJujkr4
         mphuwJv+j+T8h+W1HbdLVOTHSdc+4YWBWh+3TEQY1QEYHMSJHSQt+Jyc1FxpRTX2kXLQ
         FOzmfWI2sl6lRXziiULaQXKcVFNvKTi1NWAatU+7tVC7gRvd6lhyNcCk1V5jPY9Nvu/7
         kn5WJ6U+3pPypbrD9ogzBP86jlSd8f+fGIL8pcTJzbE2qJuie6I1B6fj3bmPpzFxFo5W
         roLOCEDCkDdjkyvKLbjrvHmph7ZPBlvDWB95XCtXiSr+xpCxWoPQVBoQpAbn6zXvR1H6
         aWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlED4eZV+jrdWtpksjfSBTfmLEjFze8GrsMJciHJ28X0D+/O2yyL1yw2X1tgZzMfL1OWwXB+SZLOM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yztl6uIIKGPYkcpoSAqHEwvjGhMStfLM9lD+BFeUCqiU2z1WJIK
	nvoL4DpdFReq5ApOEjYM1nTCvDQEIUMjGVACLGK3zfKXoHWwMay5QONDB6wXSXQTTtwzEGxMbNu
	tDJQvkA==
X-Received: from pfcp25.prod.google.com ([2002:a05:6a00:a259:b0:829:808f:cb8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4295:b0:81b:d5d9:a83a
 with SMTP id d2e1a72fcca58-8299ae60809mr419972b3a.61.1772731175885; Thu, 05
 Mar 2026 09:19:35 -0800 (PST)
Date: Thu, 5 Mar 2026 09:19:34 -0800
In-Reply-To: <20260220004223.4168331-5-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
Message-ID: <aam7JsCyQ5Oacvl5@google.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_091938_095110_58CF91AE 
X-CRM114-Status: UNSURE (   7.30  )
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

On Fri, Feb 20, 2026, David Matlack wrote:
> -static uint64_t pread_uint64(int fd, const char *filename, uint64_t index)
> +static u64 pread_uint64(int fd, const char *filename, u64 index)

I think it's also worth converting the function to pread_u64().

>  {
> -	uint64_t value;
> +	u64 value;
>  	off_t offset = index * sizeof(value);
>  
>  	TEST_ASSERT(pread(fd, &value, sizeof(value), offset) == sizeof(value),

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
