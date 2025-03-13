Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE65C28B28
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jRe0/0Z3zvMy7pu77iM4QjRxP5PkmCCi+lg1wL+mGgQ=; b=DyE+yl0X8dTYEv
	x1yfl7fDORovhJ/vktvzpXu2nQVkwn5IWyOGTF/Dn06rCO624cLdkxMDqrkXjSKepQCcES1S6ZWvW
	/uhIVJus2CbpEAPTdP8u6+L6O5tI0FW7zHmhaCQEik6dO4SfCxIo2R+bL2P7G8n8P0GCxXUcH5Ym1
	mECOjDhBolZ/6o9cQvcMloj23g8SpEtw4s38wI0D5OPZIEWNE2e+N5TWbIDO9bKBSiUiMbGA2DORh
	HCdpU56/muql5tkAuzNsqtgX8/lmPhhEhdPbBpthpyiios9yPXPLGlCsh1CNKT3BxN0Yrdx/L4nMm
	pDGGnMk9rN3lAFpP6DXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdO4-0000000ASwy-3Pfo;
	Thu, 13 Mar 2025 07:53:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdKt-0000000ARPe-2fpc
	for kvm-riscv@bombadil.infradead.org;
	Thu, 13 Mar 2025 07:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MK8zU8BVCYnjzSS/b6+zVESpZfkVHFlkYo1MXlvFt+w=; b=RXa4ZUtMPxi50UBHwBT3DROVOb
	D47rsbPcp/PmmLYFy7lvmB0AR2HQHtydhCquG4+r8j0xLw7exEevHFppkoqBolAJGJoy7vKdjl+3x
	5hs8y0dCA3K0X0freU0w2yOBBumwT/l+NmWDrF8OcMCsAVE3Dfk1yMei49ufEhMcTqhweCQDW04VG
	ee56/5xYbgkb7et9Ay9uNTztJr2wWcjYcjtku6aeEyKqA3PXYqpLuhN+oYdVu/1VP1OYbfDpwKRvd
	0JEysWUqwGe7Er+qkWobRJDXOtHyMLuCd7PnRqSzsEmeeAwV/Q2C4JSXdB7U39jb3LVKhcAjZSCUr
	Kl3gFb4A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdKp-00000002Yxq-1r7u
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 07:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741852220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MK8zU8BVCYnjzSS/b6+zVESpZfkVHFlkYo1MXlvFt+w=;
	b=A04Qh3/HLgBJHrzBVPzFMwv+Li5nJW+jeJyvNxVbR/sEye0tgm/5+XNMAGADHJoH5Bm9q3
	W0BjVEbyh7QsQfa3jTCQPVL47S/2h7mQY0py24maYtx0duq9VhcNFoIzBp+VJlX8FPNP4q
	YKi019/7z55hj8u7Syu2Tuj/DAHo0VE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741852227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MK8zU8BVCYnjzSS/b6+zVESpZfkVHFlkYo1MXlvFt+w=;
	b=hGXqWde2hPKipxtbzS8l/XaHdX1p8hyqexytlzfczCS/EItYXfYMBMQ5KJWBsNd45+Rgs8
	vkvsUwb+qBytAQ3aoNe5pssP75E8/Gz0e9LahNEOM09GEZ4n8ah8qTFD2xrdKLkApPruIr
	MPtRocnAbxZVzvOCbHrJJ1BJ8K9C4iQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-5CcSuH57OXykFNt7ldTxGA-1; Thu, 13 Mar 2025 03:50:18 -0400
X-MC-Unique: 5CcSuH57OXykFNt7ldTxGA-1
X-Mimecast-MFC-AGG-ID: 5CcSuH57OXykFNt7ldTxGA_1741852217
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so2964155e9.2
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 00:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741852217; x=1742457017;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MK8zU8BVCYnjzSS/b6+zVESpZfkVHFlkYo1MXlvFt+w=;
        b=LHkJ/eHSyPI0xRBO5WnkfUzcXsSDxik9WgbvVwh37o9wpCcMM47yK5IzyTGo8Iz1hZ
         wHfHW66/Y6KIOFWzhILG3xSrsUwzUcD57QuTJthIKLBOsGPd/CzLAmdFYyXrueGzHpXv
         iuaxDUEVW9jbOY+QQuxVY/jQUOdNS3ZutN313o3X8B/4RBxiL1HhnkIWWIN6w4RhSpwl
         zRhoBITelx4kPmmDUIO/N4/VxtPKzXyKxTWB0KWv9Kq9udkuZ8xjmSJ8sgz1Qsk/SB/g
         uNxKz+yaQxg7u2qUEgFKZ2ov6r3mySYBsm51N/FIq0qD9C8QLAsydKCUJUFmI17fxAUb
         DTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBHQkOI/YAuUnZXsMMDIoTKZbxAWe3iDZT8RBQgSbD9A1wVLut5ShazVK4x70t7u3gkNuAs7qG5MM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9f26QiFilM+IxTIRu+lD3+d7MxTxkZGr6ywKH3FooSpmgMIYv
	2mKHRshuthSNBeavRuew4l29KSCctqI2CechJ8cF/6dTJO2WceWqOgSFHqmG2toTUG9rPWLoHXY
	AcRvJAkuWlhL+tEc5OoJHAdPBQaISsVqIp/zsvoQyz63c3rHQMCETTjhU6EyWN8Q=
X-Gm-Gg: ASbGncuTIxRQou9Wptqe6PS6sArW0e6iYTT/2yFX9Hr6EC9QGAicr2PYYR5sxOrHfBM
	pE6XBhX9TFlFmDp9jxh+wVwLe7jsAakS1yCosWDJtAQeG0SNdSIxDY8Mk9ApEe15SCNGR0ZNSZU
	+3nZL7hZEv4Y5HvgpTbDXeGlzCbT2VzCJRvqhrvHFK25ES1UGrMHdH9iun7yxeS+/l3dN3z/tGY
	uHafz9lJdCzsRD8RguhKq4oYPCHTXDJEP1cJUVTXFSVTRXUNY9oeVjk7mpARzGphZDISTvHMQh3
	RWyVZQRGbrP5QZVPQ+1nKPuxSwVJPRxmK63dZg8Z8k5vuPU=
X-Received: by 2002:a05:600c:1d09:b0:43c:efed:732b with SMTP id 5b1f17b1804b1-43cefed78bcmr155422035e9.5.1741852217429;
        Thu, 13 Mar 2025 00:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwegUed+fQ9ljIYT2+ReraOGwFw7qJPttYdCzfqNHOxAXgAxI15SBvV5/+7QXKHcBvWKjG5A==
X-Received: by 2002:a05:600c:1d09:b0:43c:efed:732b with SMTP id 5b1f17b1804b1-43cefed78bcmr155421735e9.5.1741852217063;
        Thu, 13 Mar 2025 00:50:17 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-51-207.web.vodafone.de. [109.42.51.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8e43244sm1218116f8f.60.2025.03.13.00.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:50:16 -0700 (PDT)
Message-ID: <0019ac7e-b190-4b1d-9c8d-f5f039cd53ba@redhat.com>
Date: Thu, 13 Mar 2025 08:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2] Makefile: Use CFLAGS in cc-option
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, alexandru.elisei@arm.com, eric.auger@redhat.com,
 lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com,
 nrb@linux.ibm.com
References: <20250307091828.57933-2-andrew.jones@linux.dev>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250307091828.57933-2-andrew.jones@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Tg02m3eMVvKwXPbWiyxEL4zYy5ecZFKUkqTNwyHU84_1741852217
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_075031_676539_6B76E9AA 
X-CRM114-Status: GOOD (  13.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 07/03/2025 10.18, Andrew Jones wrote:
> When cross compiling with clang we need to specify the target in
> CFLAGS and cc-option will fail to recognize target-specific options
> without it. Add CFLAGS to the CC invocation in cc-option.
> 
> The introduction of the realmode_bits variable is necessary to
> avoid make failing to build x86 due to CFLAGS referencing itself.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
> v2:
>   - Fixed x86 builds with the realmode_bits variable
> 
>   Makefile            | 2 +-
>   x86/Makefile.common | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 78352fced9d4..9dc5d2234e2a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
>   
>   # cc-option
>   # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
> -cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
> +cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
>                 > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
>   
>   libcflat := lib/libcflat.a
> diff --git a/x86/Makefile.common b/x86/Makefile.common
> index 0b7f35c8de85..e97464912e28 100644
> --- a/x86/Makefile.common
> +++ b/x86/Makefile.common
> @@ -98,6 +98,7 @@ tests-common = $(TEST_DIR)/vmexit.$(exe) $(TEST_DIR)/tsc.$(exe) \
>   ifneq ($(CONFIG_EFI),y)
>   tests-common += $(TEST_DIR)/realmode.$(exe) \
>   		$(TEST_DIR)/la57.$(exe)
> +realmode_bits := $(if $(call cc-option,-m16,""),16,32)
>   endif
>   
>   test_cases: $(tests-common) $(tests)
> @@ -108,7 +109,7 @@ $(TEST_DIR)/realmode.elf: $(TEST_DIR)/realmode.o
>   	$(LD) -m elf_i386 -nostdlib -o $@ \
>   	      -T $(SRCDIR)/$(TEST_DIR)/realmode.lds $^
>   
> -$(TEST_DIR)/realmode.o: bits = $(if $(call cc-option,-m16,""),16,32)
> +$(TEST_DIR)/realmode.o: bits = $(realmode_bits)
>   
>   $(TEST_DIR)/access_test.$(bin): $(TEST_DIR)/access.o
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
