Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC68BC7115D
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zwP+9sD4DZ1riDgg8u4TcyXjl+XxVqaGAWvXAOIevY=; b=jN6bqgFWVoKLjq
	Gq5zRRXI0O0CkIpVzNYWtOT49UUY/ynBoIYBeczVJtU3bWQ2ILQzwoEiWie0C2T6Fs16X/3erOnsT
	m2GJAjWBhBiQBGatoV6Bz+ObxZ1V3wZNHFp6MN3I0K8SjV4l9ZQceEZ1w5xAPJ0mLv238NA2qADit
	Ek6JK7hvd46C8RRbCUT5xmAl/KMKT0MP20y9vo5eOUpe8ETwAmEDCqu3vg92c5QJHaDw9C7/CGhbz
	5Sa/rIF7aCoTcFdVXAxPV1hwftIYUVJU/snvbEP3/fwT5qrCi6E+5YXwu2BmC/S+Q0IxdRFbCCbT1
	7pzZy+3+4WVbx6zPbeaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcFh-00000001yCY-2i9I;
	Mon, 23 Jun 2025 08:10:05 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcDh-00000001xri-2K8B
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 08:08:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-747fba9f962so2870842b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 01:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750666081; x=1751270881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxpsxBnAztApt9xBJdH0Ct2uH1bvpAVjnJKcApgLnKg=;
        b=dlBPArimuNUZGcmuE7g3NDr/Uyvk+QFHYsIA8aJwnl//FVXhHjtduTD+a1N9vinn+a
         r8HbbExnpcKAKofMnYIFAMbDGUk8pFA2nq6Ye9rln9SQLs4NNw3GfluK+Lrv9Ie1lZ0v
         u5ojEZI9KfzyPhmGKjaMh66BxycwW3qC2iWw0qukp0qaukAe2h4yCzBX/VlRCCiydh8b
         tRauEOdXdOj0cufJkcQE3azDVM6os9W0YE0jZCP/VTtPQKnbdi8Dp5WAuiXLg5rUSzkf
         0d6BQ4W7YTfhBHKfpin3rswGKp+gztu6AbNZA85zog+OllA43wyA3pOVHlduV7+pcTQZ
         b01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666081; x=1751270881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxpsxBnAztApt9xBJdH0Ct2uH1bvpAVjnJKcApgLnKg=;
        b=D8+KPF8BfoB7XYQJfSFOwvA6p3Py8zL7sEUMIQq7KHI/Dcu3R7BMA8roaGKa/RuvLm
         DMLDZnLQTwzAXzc3UxKR0+X0jprHVdPrlp0Hn9nv4RngKyjaSNnpERpZ3z/uzB6rvLI0
         1Bgokluk8PD5fTmyYSb0LGYG+VEALdPjtFg5DDMenofy5Ze9UpHM1P+N7yrLCfiTRizm
         4soRZhq3r0U4thm5p4V4+WVKrzDB9Tr6Ka884nZM96q7SN9BAUSiwbpPLPrVS/gCusgv
         EBBrHLh25kUWPprN4RQRx5KM4UUupkXshPRGD7MRpTtnNUevMYH0qEz2ssPsm/R2WuzI
         qQCg==
X-Forwarded-Encrypted: i=1; AJvYcCVifvOtaTBrjJiMIdMIw4VrR1bI67vl04S5OHR3yG5yNVHjtws2lPYwh3qkY2LfOnJOyKqfrtA3GB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPX+QWxb4HIE1ah329A7Idz7NMPfU7vcdKaHT1W+dpNsFIWMGc
	EsT95+eJKh9Ztyax2Zi5d5Gbtaazi3nvaCASv04e4hBo/5fI6Os2YVxtocBN9ual8WXxH8tCAGF
	QQEeUOEc=
X-Gm-Gg: ASbGnctfGE0IaDuwfy4SDPHS3sWkxhgAxwXjbmk+0oEQvyBKG8erK7BLlbGlnVmDacD
	u24sLCd9iP10iz7UUFW12m7jh65y4yiPYCvRYNJLVsV03J7aqdmzuChJ4M2TZdb2vTs81reQxHt
	x3Z0a49TrZgTSy2B7maFqtUHtJOuPjlmVjbauCcR5MN0BogIPfWELNCViaNBgZvUDfNCQXMzDui
	aZEYiArCtqItiLqWKlI26wQhkPHI0Z1SP0x7R9/qR34NfSCgIo1RBDesLyAjw4RFGQXfIhsNKZ1
	ua+QtfJYnB11HPtvCR+A285wt6CsUsufDpFMdDrc7R24WFD8wsc//cz4rG3C6SKtut3E8JOCPP5
	NJVAqmpeOAw0CysRn56rxN306VegVldycdvGu+CORoA==
X-Google-Smtp-Source: AGHT+IHuhK51wxxmabIbzoHHlgBq8UYX82HbhRz2QXhvMRsa67AChvnWz1JFNbTr22S/kvZSFTb/jQ==
X-Received: by 2002:a05:6a00:cd4:b0:742:ae7e:7da1 with SMTP id d2e1a72fcca58-7490f287c44mr14337992b3a.0.1750666080714;
        Mon, 23 Jun 2025 01:08:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64b2aasm7719241b3a.116.2025.06.23.01.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:08:00 -0700 (PDT)
Message-ID: <c12729a1-5046-4821-b5fe-5fea72af76c8@rivosinc.com>
Date: Mon, 23 Jun 2025 10:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Move duplicated instructions macros into
 asm/insn.h
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_010801_602108_19CEA089 
X-CRM114-Status: GOOD (  11.99  )
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

CgpPbiAyMC8wNi8yMDI1IDIyOjIxLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gVGhlIGluc3Ry
dWN0aW9ucyBwYXJzaW5nIG1hY3JvcyB3ZXJlIGR1cGxpY2F0ZWQgYW5kIG9uZSBvZiB0aGVtIGhh
ZCBkaWZmZXJlbnQKPiBpbXBsZW1lbnRhdGlvbnMsIHdoaWNoIGlzIGVycm9yIHByb25lLgo+IAo+
IFNvIGxldCdzIGNvbnNvbGlkYXRlIHRob3NlIG1hY3JvcyBpbiBhc20vaW5zbi5oLgo+IAo+IHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDQyMjA4MjU0NS40NTA0
NTMtMS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwo+IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1yaXNjdi8yMDI1MDUwODA4MjIxNS44ODY1OC0xLWFsZXhnaGl0aUByaXZvc2luYy5j
b20vCj4gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNTA4MTI1
MjAyLjEwODYxMy0xLWFsZXhnaGl0aUByaXZvc2luYy5jb20vCj4gdjQ6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwNTE2MTQwODA1LjI4Mjc3MC0xLWFsZXhnaGl0aUBy
aXZvc2luYy5jb20vCj4gCj4gQ2hhbmdlcyBpbiB2NToKPiAtIFJlYmFzZSBvbiB0b3Agb2YgNi4x
Ni1yYzEKPiAKPiBDaGFuZ2VzIGluIHY0Ogo+IC0gUmViYXNlIG9uIHRvcCBvZiBmb3ItbmV4dCAo
b24gdG9wIG9mIDYuMTUtcmM2KQo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gLSBGaXggcGF0Y2ggMiB3
aGljaCBjYXVzZWQgYnVpbGQgZmFpbHVyZXMgKGxpbnV4IHJpc2N2IGJvdCksIGJ1dCB0aGUKPiAg
IHBhdGNoc2V0IGlzIGV4YWN0bHkgdGhlIHNhbWUgYXMgdjIKPiAKPiBDaGFuZ2VzIGluIHYyOgo+
IC0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjNQo+IC0gQWRkIFJCIHRhZ3MKPiAtIERlZmluZSBS
Vl9YKCkgdXNpbmcgUlZfWF9tYXNrKCkgKENsw6ltZW50KQo+IC0gUmVtb3ZlIHVudXNlZCBkZWZp
bmVzIChDbMOpbWVudCkKPiAtIEZpeCB0YWJ1bGF0aW9ucyAoRHJldykKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gQWxl
eGFuZHJlIEdoaXRpICgzKToKPiAgICAgICByaXNjdjogRml4IHR5cG8gRVhSQUNUIC0+IEVYVFJB
Q1QKPiAgICAgICByaXNjdjogU3RyZW5ndGhlbiBkdXBsaWNhdGUgYW5kIGluY29uc2lzdGVudCBk
ZWZpbml0aW9uIG9mIFJWX1goKQo+ICAgICAgIHJpc2N2OiBNb3ZlIGFsbCBkdXBsaWNhdGUgaW5z
biBwYXJzaW5nIG1hY3JvcyBpbnRvIGFzbS9pbnNuLmgKPiAKPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9pbnNuLmggICAgICAgICAgfCAyMDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIHwgICAyICstCj4g
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgIHwgMTQ0ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jICAgICAgICAgICAgIHwg
ICAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jICAgICAgICAgICAgIHwgMTI4ICst
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTg4IGluc2VydGlvbnMoKyks
IDI5NCBkZWxldGlvbnMoLSkKPiAtLS0KPiBiYXNlLWNvbW1pdDogNzMxZTk5OGM0Mjk5NzRjYjE0
MWEwNDljMTM0N2E5Y2FiNDQ0ZTQ0Ywo+IGNoYW5nZS1pZDogMjAyNTA2MjAtZGV2LWFsZXgtaW5z
bl9kdXBsaWNhdGVfdjVfbWFudWFsLTJjMjMxOTFjMzBmYgo+IAo+IEJlc3QgcmVnYXJkcywKCkhp
IEFsZXgsCgpJIGFscmVhZHkgZ2F2ZSBteSBSZXZpZXdlZC1ieSBmb3IgdGhlIGxhc3QgdHdvIGNv
bW1pdHMgb2YgdGhpcyBzZXJpZXMgaW4gVjQuCgpUaGFua3MsCgpDbMOpbWVudAoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
