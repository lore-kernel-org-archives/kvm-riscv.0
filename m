Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43B3C54F2E
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 13:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwRCtoFrpDXSnb8+K3Qk3PFmrFBi5peZrdskxEbFFE8=; b=oq7HGHgZUURIqx
	+NxliEGHqO36Wf87y3m+O+MdOx2LmFeJ4M5Pmzjqsr7FLMn5hVjYD1qK5OwZjNpNw58P6ndZSn3Y3
	Mfmm11DyIK0/EQUAkMZ6BprPps2ajsjfg6rSyWMonQ8S2mOqsyPfY1/VTGrOa5Aclz9+INeeC/nNR
	zy8h3cqLXMbR1J6kSB9uo22SZ99DjE6VouXP/Q/cnUtSEHpgexcYa2l34t+GJOh7QJ/zjqa4LHfoj
	v/iexzmebwmBR0d8+Ne6O6BS1eCkQlNH1djFPv047DAoES77+4VJHy5gX8V3bBc54zPPaeGbyTaoN
	BGigCUazMQ8QKrvij2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISMA-00000003wL4-1030;
	Fri, 23 May 2025 13:22:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIS61-00000003txA-1DkJ
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 13:05:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a367b6ad08so802888f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748005556; x=1748610356; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFewfZjNIOlnKjbSqghMjET5KPXnaKP3RNtWcft+NNM=;
        b=AYhP6MkaRjUrmO5eoupsxR8ljvcXFgDq04KAIgvQYq957OrvoYXz4GLlqSl5wJyJSd
         ZVW/uR+mvNW6WFSphQ/Xc1cq5cQvhYtRpN2COGXNPLDXmM5JjNsCQQEN7oHGm1qD4Rkb
         UbEG4r7IxZZ3sbiTtLk2EpyFlwYQ/ZSvRbxGPrDgKwS5wMLLxg++aGRYSJWVjI/8//j8
         IwYPQAk+j1BFwXppqPb58H3h89l0lLs9jt7WJD1xsoPDYbpIUMw5+09sJ2lqX4WiDvUb
         h39hkrihzeVT4PZ2ZlzKt/Qj8jXXbRfAjdXUO4tEncnAj48iuaeipYrumLJeytpDVW5E
         rB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748005556; x=1748610356;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gFewfZjNIOlnKjbSqghMjET5KPXnaKP3RNtWcft+NNM=;
        b=K/9ltXMf+ymBZlM5IFMjRJX/kj/D+SbYxW+hCm9jwavirduj9U/0iURgJSOa1NVN06
         Mbco47bWCl42D+ITzlzdX1NwFXd6fX1n78KWCNO/R8iW9RwTphYdB+B2D8SgEdlcMwUv
         jxD870e9ucL8PilshU3OvRfMYz1PytZmGAVRPefE6fw66HlPnwLrPKe4rvpdGc+YvkIh
         QE7hhaHVLf8Ycgixkd4z4nq3UJzoEjCCdFkhdFbxY8aHbuD1bWDv8JJcTnA6UL6eu0/p
         1P+asgie0A6ejeXoo2wMfmLEHSPMMy/6FLKoCz/KRsO2U5/ValcsMubft3rlIFl28yDc
         JyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHDvjvlksbK4irCkhnAHw8GSlFQTikMKchAuLv7q16pEL97kUWyIpGkVqdvEj5RO9D1ysncJnL69w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGHi9nvoqwLnsELAQo3JLArcxCVmr0r8y6WxH7MXmBpr9KZXxw
	W2NvSkHKGv9Pdvf5q4vK9/gI4g04UT0puFlsRz31JJwFPgP5qk34SGt9ZtBzekanhKo=
X-Gm-Gg: ASbGnctbtzHWMHC8k9070k2NgKaZ9yP/50ey7Tq5Yo7Ni/2TI4lX3js5Q5Rbeab1Tjd
	q/b8DlHI76mXNJ0KvOxuoBnbdgDIqrEmcn5zomOGojv7jLqR+8gXiJW6NyAgQScifU827qeDYoE
	0N5lKJt0TqRIYDcSZpMt1ekdtCVDNtvRsYAgZKFnQSVxO76fOWHC/E5BmUcN5mq9BtGSF2wCaea
	ZNsHaedn7YNRopGzjg6lB0xbgfG80f2dwT2jzuYJIB0oR4119pLiQMZEuD2tTfQltWJjjt8SEKf
	LqvD6o7AYnjlFBsM7W8PggWucXONQ9llW8qtpEuWTGCRb3U0SjyDoksj0Bo=
X-Google-Smtp-Source: AGHT+IEYIo39joB/0uuiMCLZj0X9kGxap7PQ8MzBUGOeMKLVyBYJHZJSgGJhoZMNlP15r1mU9RPZpQ==
X-Received: by 2002:a05:6000:4285:b0:3a3:5c97:70c with SMTP id ffacd0b85a97d-3a4c2e5707cmr874240f8f.14.1748005555660;
        Fri, 23 May 2025 06:05:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8899bsm26390515f8f.62.2025.05.23.06.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:05:55 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 23 May 2025 15:05:54 +0200
Message-Id: <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI
 extension
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "Atish Patra" <atishp@rivosinc.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>, "Atish Patra"
 <atishp@atishpatra.org>, "Shuah Khan" <shuah@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-14-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_060557_327415_9B8F6F6A 
X-CRM114-Status: UNSURE (   4.97  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

MjAyNS0wNS0yM1QxMjoxOTozMCswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiArc3RhdGlj
IGNvbnN0IGVudW0gc2JpX2Z3ZnRfZmVhdHVyZV90IGt2bV9md2Z0X2RlZmluZWRfZmVhdHVyZXNb
XSA9IHsKPiArCVNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAo+ICsJU0JJX0ZXRlRfTEFO
RElOR19QQUQsCj4gKwlTQklfRldGVF9TSEFET1dfU1RBQ0ssCj4gKwlTQklfRldGVF9ET1VCTEVf
VFJBUCwKPiArCVNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORywKPiArCVNCSV9GV0ZUX1BPSU5U
RVJfTUFTS0lOR19QTUxFTiwKPiArfTsKCkhvdyB3aWxsIHVzZXJzcGFjZSBjb250cm9sIHdoaWNo
IHN1YnNldCBvZiB0aGVzZSBmZWF0dXJlcyBpcyBhbGxvd2VkIGluCnRoZSBndWVzdD8KCihXZSBj
YW4gcmV1c2UgdGhlIEtWTSBTQkkgZXh0ZW5zaW9uIGludGVyZmFjZSBpZiB3ZSBkb24ndCB3YW50
IHRvIGFkZCBhCiBGV0ZUIHNwZWNpZmljIE9ORV9SRUcuKQoKVGhhbmtzLgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
