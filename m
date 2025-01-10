Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B89BE77188
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 23:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6Kso7EZV113LZ0pSrhJro9SSs+qggqLZsFSRt16Ctg=; b=ZpOLpChtH05gqz
	S7dlzoLxVYwJD9O9DBqMtBLZNCcjk2aAdjOK1RfgoviS4o1a0Ql1sbcYFe0sIwOUviLH7pcV5/shR
	Ur5cHYRBUqvotPvBomNKVCRvesZNxUoL+w4toMAWW680pCKuVYeOodVgYHx3Fw7imguPSFD93KiUk
	kmdUk9iZpz4+I82X/m29EUXDUM4/549891zOp/rpwu70iF/RvDE7cjPKoYyxpzdtR8fUIFETe5h8v
	6AtSYkcWfX3Oo8JK3h55YlnmVvsQScc0tSaNAHod9jEHmHhnMSuWvWL2RuEcIr70iDjrN/QC6vYtU
	zAptqVKnZIZEfqomnONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWON5-0000000HGpI-3glF;
	Fri, 10 Jan 2025 23:24:55 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWON3-0000000HGoV-10zo
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 23:24:55 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-844d7f81dd1so86948239f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 15:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736551491; x=1737156291; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+SjCp51VyP6GzGq5teBicdgUcduwA5OqOX8nMmSrGMM=;
        b=GEK468XD74Ugyt47Wzct2FiI0/f6XNMNTf7yVMJW5P5an81A9hJc48hyIo3sVOpiaF
         TuSfI+FGeHm7CfngTZ7/gJ8Y9Q7U1FzVUEjXoXauhfr1iyKMlJcfSuocl1PPiIOfupvM
         WEsw0hxKZRhS0xr3ZdrV+NjeXNEKFvvle6+RFEEyXvd8GYEHJVRD1iZNK2qko/k2dnOQ
         npW/E224+ty1MGejO8f58E0WGtmL9+557bWKilgqDRbapvCh085+gqC0pdCEK56rrCDv
         eX36auAoKYrmUfc2ymrA7qITswQl9svuV3qj0blMOH7KzQaarE/FKtgZaOI1eql9D79l
         B4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736551491; x=1737156291;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SjCp51VyP6GzGq5teBicdgUcduwA5OqOX8nMmSrGMM=;
        b=age/0YJrzrApr+9vogPKApxc25dgeoA5dtRE2oZpacT5l0IQa4zrsgqBwmGZxph+IT
         VkbBPmMqv/XARD4PNOA3qiZNfxXjU15mDkY6oYI8WaZiO7lwn1Q0rhlenIMfRXKkh2j7
         pOeMs+oLCab9ME1u4f8J2YClkAEf+zTmCoLxp3UhqpLVHrVQYIR0HHbr5OP2+Or7dXWd
         ZV/Ba40ICHYUD5dDG6qRMYYiJnGJ8K8ldCfWh5BZh2c+E6q4AjyOceGE1HV6V0WBM6Fv
         u3g1eHr4oSTjlvj9sDuQMLRT064WQqH+ePNmwdBaxEvzm6EbVVY53V520cVqhvDh815k
         6CJw==
X-Forwarded-Encrypted: i=1; AJvYcCWDXBIM6MYg4AAX8Hg2Tu0zgGfSYsMfm/3TJPI/rtHmiMhbg2FvoBy0DbitkjTDs1ZBBI8k0JBmKxE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwR5qZBFS08HOGnZZ32C7s+ultbxF9wSA5BnodBx1y2EFaY2R7p
	6pNyTU2ljJdiMkIN7tODZgE/uTJBSQC1QHmBmGcDNKEdxbviEYY6//a5dpzgzJg=
X-Gm-Gg: ASbGncv9RGQgc8yw8HXqsHLJO67B7OfleY0WVAA+zQPHOnUwOv1T+clMqvz97cwanEx
	/UwlWNgvsZib688OFYiEV1rnplUAZZKxsXqXtzPMTrh0J1uvjuNxe5FJPP1iA0aABLDK4ieVjV6
	v7PuPXfQrZ5DGejFUMW5rQGkMFkV0/TZPGbAmspBKX1WLQ86HgOHYJfyNzxTPJ9M2vgEnsuIGYV
	8s5sZcFOaIInvsyQzd+bnA3ESGA2slSrWsz4nyMOPlPTmyLwXYkVD3JWFABKt//y7BOtf/KVJl3
	fDHG
X-Google-Smtp-Source: AGHT+IFnLUyPrnYBBe92X4rwhtK25h1zVqhYbmHNT0fZHuKmBld5PyaTYcos/pwpc7H1OLYSIEgaZw==
X-Received: by 2002:a05:6602:36c8:b0:84c:b404:f21f with SMTP id ca18e2360f4ac-84ce018d1a7mr1065030139f.13.1736551491667;
        Fri, 10 Jan 2025 15:24:51 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea1b718a36sm1132519173.108.2025.01.10.15.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 15:24:51 -0800 (PST)
Message-ID: <69426339-fb89-49d8-b23c-764f953428be@sifive.com>
Date: Fri, 10 Jan 2025 17:24:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] riscv: add Firmware Feature (FWFT) SBI extensions
 definitions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
References: <20250106154847.1100344-1-cleger@rivosinc.com>
 <20250106154847.1100344-2-cleger@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
In-Reply-To: <20250106154847.1100344-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_152453_336005_641DF81C 
X-CRM114-Status: UNSURE (   6.68  )
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

T24gMjAyNS0wMS0wNiA5OjQ4IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gVGhlIEZpcm13
YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQgb2YgdGhlIFNC
SSAzLjAKPiBzcGVjaWZpY2F0aW9uLiBBZGQgU0JJIGRlZmluaXRpb25zIHRvIHVzZSB0aGlzIGV4
dGVuc2lvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAyOCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25z
KCspCgpSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5j
b20+ClRlc3RlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+
CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
