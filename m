Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFADC28B23
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 16:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P8+Xa4yNKLk6gwfwVU6NP9aZgvQZAoX8ICN39tzM3EI=; b=eZZDOVR4nGc5ls
	WbbizCOBiF3+1gfMsqWA101ihXUxr8u+nOJ0zTvttNcgSv/JRlgH33rB3cEbCcUE+IIUIVHQZfkI6
	9Zc+T/mFAUjkLO6xC4VG6vbo7LZVJlLGNcG6pbIiiXl2MuzHSEgpYXFDkeMQN0t7tT0Mj0sY2y50B
	X78zkC+crtFuIs+1MuHowDOp5YlS8L5MGoGYXjnb6n2GT2oBmsLhG4jYMVltk727O3YaUDn+uU5Dv
	cRkn44PZ79NopnsQpbImYAoNLYcScNZUsT6dpFUg9gu7RaPTRN2cUkRf+Tn3McHcje6NTJkZCAnC6
	OqgEofWhA/cH/pxDHkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaNH-0000000ErIT-4Bq8;
	Fri, 07 Mar 2025 16:16:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaMb-0000000Er2X-30V7
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 16:15:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso23883305e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Mar 2025 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741364151; x=1741968951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ma6UNYm4yNX/ZvXcUmutWIxQKtLrtbmF18vjvUMyo+0=;
        b=uXCp+rcwPPaZwvWCRxHShj5Rz22/2dt1lp4N15abum+yCmO86nzFLFxLUqWWyn93f8
         Mys9NGRkOgtyYsbVgJZHvhfAq8e/OPS4GP5tmIl1ITOGEvcHKQBcsP8rNycgB3qiqqDO
         XrmVzofhInM+8GYQjezWUp+oRYBoELNXgMk+t4WMIgOWpnX7t2F2WnKXL3BEb7feSxzt
         6TIzCvSjenWdZk4xYlhQjN8U4sCx3a5n0PmQ4CzhXXO3iDwwi9U7h7sq75+8N/GkEOaZ
         Lr6bFRsyz3WZ8lRtvGliHmVA0juXjao+UvC41sCulbZXARNjd6suPMDvB0mhPX6Ucxge
         nscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364151; x=1741968951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma6UNYm4yNX/ZvXcUmutWIxQKtLrtbmF18vjvUMyo+0=;
        b=M/HQMOPM8o8xaZ2O5CEqpNJ8HPe+D79K6G0CkGhKGs7tVQ+/HmY3uOwR5o8ozn0Us/
         RvJYLCH5C+mXGXNSDhUifJP45w1pTqRgTG7L/oDi0w9NwmI/0SQZcevfJaImTLOaTyQf
         aFZvuliou6Au0SS34VTQbgNnlHDBGgKOae/H/Ki6biEa/9q2bAjarGHvzcHaE+DTCYpH
         AENqd7oARaoO/AAOz2bgWuNrRKazPOpqLS7ap2jKnohQV/mPfGtzaR83QHX/WKZxkceg
         plWUzlG+ZNbw1ZIWSWt9nKk4aiFOzg7x6wNIhvVl2LsyKU8ThKX03mCV50rUPjHtjbul
         cA7w==
X-Forwarded-Encrypted: i=1; AJvYcCWIQVsA0UarENf2qy6wb59qnLdokOGdf9+R722oPd3JqXRgt1q3pfYyZfhtlg2SddAUT1dSu0ID6ws=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9XWkKMCY/kEWemZaNqQXEXSa3AXJ0b9bPj5KavCjS+Bccssy2
	3SshHb0r5tNixpBIqI6soFPRLbleFaI/SXYOGWtTtDrkHvzHaRcTamk9YgZMSiA=
X-Gm-Gg: ASbGnctunlG/1jAZy9qiJ+z+UI8jTJgIDJPyr1kY5/GxSCEJva0ZvLJhqiiUjdUhEQj
	4/MUkMYdqe1gzWhMi6uLP1353dEw+wkecVYe7kqZRLRnc+pX2E5xiFfJpGDURXKpzURa2Gh6H5e
	sXS7mEF3m6SFUlKExvei4E2HMg6yX4RZk3b4PMQdlKgwmeookbNALQEhEa9NZ6dRKnYTQO1nUd9
	yHEUKyKpkXmnDz0NH2lBM8jVTnfEIljMv/hpDefB7KLrPg9yXePxDkFBpc/PhQzXcNAEW8BbgKw
	kLQDajDMpL7ILeCknf7VkWsVJ+aObwR0u/T3L2iJ22i43w==
X-Google-Smtp-Source: AGHT+IF7XbE04CqOvEX8W4K9LRBGFZNizyeeIKygHO9HjdO9iwyVbPTpDERhNgQ3kKf0mPYmzxYulg==
X-Received: by 2002:a05:600c:3544:b0:43b:ce36:756e with SMTP id 5b1f17b1804b1-43c601ccce3mr37788095e9.12.1741364151285;
        Fri, 07 Mar 2025 08:15:51 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8daadbsm55496245e9.21.2025.03.07.08.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:15:50 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v8 0/6] riscv: add SBI SSE extension tests
Date: Fri,  7 Mar 2025 17:15:42 +0100
Message-ID: <20250307161549.1873770-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_081553_948160_508F79A4 
X-CRM114-Status: GOOD (  14.50  )
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

VGhpcyBzZXJpZXMgYWRkcyB0ZXN0cyBmb3IgU0JJIFNTRSBleHRlbnNpb24gYXMgd2VsbCBhcyBu
ZWVkZWQKaW5mcmFzdHJ1Y3R1cmUgZm9yIFNTRSBzdXBwb3J0LiBJdCBhbHNvIGFkZHMgdGVzdCBz
cGVjaWZpYyBhc20tb2Zmc2V0cwpnZW5lcmF0aW9uIHRvIHVzZSBjdXN0b20gT0ZGU0VUIGFuZCBE
RUZJTkUgZnJvbSB0aGUgdGVzdCBkaXJlY3RvcnkuCgotLS0KClY4OgogLSBTaG9ydCBjaXJjdWl0
IGN1cnJlbnQgZXZlbnQgdGVzdHMgaWYgZmFpbHVyZSBoYXBwZW5zCiAtIFJlbW92ZSBTU0UgZnJv
bSBhbGwgcmVwb3J0IHN0cmluZ3MKIC0gSW5kZW50IC5wcmlvIGZpZWxkCiAtIEFkZCBjcHVfcmVs
YXgoKS9zbXBfcm1iKCkgd2hlcmUgbmVlZGVkCiAtIEFkZCB0aW1lb3V0IGZvciBnbG9iYWwgZXZl
bnQgRU5BQkxFRCBzdGF0ZSBjaGVjawogLSBBZGRlZCBCSVQoMzIpIGFsaWFzZXMgdGVzdHMgZm9y
IGF0dHJpYnV0ZS9ldmVudF9pZC4KClY3OgogLSBUZXN0IGlkcy9hdHRyaWJ1dGVzL2F0dHJpYnV0
ZXMgY291bnQgPiAzMiBiaXRzCiAtIFJlbmFtZSBhbGwgU1NFIGZ1bmN0aW9uIHRvIHNiaV9zc2Vf
KgogLSBVc2UgZXZlbnRfaWQgaW5zdGVhZCBvZiBldmVudC9ldnQKIC0gRmFjdG9yaXplIHJlYWQv
d3JpdGUgdGVzdAogLSBVc2UgdmlydF90b19waHlzKCkgZm9yIGF0dHJpYnV0ZXMgcmVhZC93cml0
ZS4KIC0gRXh0ZW5zaXZlbHkgdXNlIHNiaXJldF9yZXBvcnRfZXJyb3IoKQogLSBDaGFuZ2UgY2hl
Y2sgZnVuY3Rpb24gcmV0dXJuIHZhbHVlcyB0byBib29sLgogLSBBZGRlZCBhc3NlcnQgZm9yIHN0
YWNrIHNpemUgdG8gYmUgYmVsb3cgb3IgZXF1YWwgdG8gUEFHRV9TSVpFCiAtIFVzZSBlbiBlbnYg
dmFyaWFibGUgZm9yIHRoZSBtYXhpbXVtIGhhcnQgSUQKIC0gQ2hlY2sgdGhhdCBpbmRpdmlkdWFs
IHJlYWQgZnJvbSBhdHRyaWJ1dGVzIG1hdGNoZXMgdGhlIG11bHRpcGxlCiAgIGF0dHJpYnV0ZXMg
cmVhZC4KIC0gQWRkZWQgbXVsdGlwbGUgYXR0cmlidXRlcyB3cml0ZSBhdCBvbmNlCiAtIFVzZWQg
UkVBRF9PTkNFL1dSSVRFX09OQ0UKIC0gSW5qZWN0IGFsbCBsb2NhbCBldmVudCBhdCBvbmNlIHJh
dGhlciB0aGFuIGxvb3BpbmcgZm9wciBlYWNoIGNvcmUuCiAtIFNwbGl0IHRlc3RfYXJnIGZvciBs
b2NhbF9kaXNwYXRjaCB0ZXN0IHNvIHRoYXQgYWxsIENQVXMgY2FuIHJ1biBhdAogICBvbmNlLgog
LSBNb3ZlIFNTRSBlbnRyeSBhbmQgZ2VuZXJpYyBjb2RlIHRvIGxpYi9yaXNjdiBmb3Igb3RoZXIg
dGVzdHMKIC0gRml4IHVubWFzay9tYXNrIHN0YXRlIGNoZWNraW5nCgpWNjoKIC0gQWRkIG1pc3Np
bmcgJChnZW5lcmF0ZWQtZmlsZSkgZGVwZW5kZW5jaWVzIGZvciAiLWRlcHMiIG9iamVjdHMKIC0g
U3BsaXQgU1NFIGVudHJ5IGZyb20gc2JpLWFzbS5TIHRvIHNzZS1hc20uUyBhbmQgYWxsIFNTRSBj
b3JlIGZ1bmN0aW9ucwogICBzaW5jZSBpdCB3aWxsIGJlIHVzZWZ1bCBmb3Igb3RoZXIgdGVzdHMg
YXMgd2VsbCAoZGJsdHJwKS4KClY1OgogLSBVcGRhdGUgZXZlbnQgcmFuZ2VzIGJhc2VkIG9uIGxh
dGVzdCBzcGVjCiAtIFJlbmFtZSBhc20tb2Zmc2V0LXRlc3QuYyB0byBzYmktYXNtLW9mZnNldC5j
CgpWNDoKIC0gRml4IHR5cG8gc2JpX2V4dF9zc19maWQgLT4gc2JpX2V4dF9zc2VfZmlkCiAtIEFk
ZCBwcm9wZXIgYXNtLW9mZnNldCBnZW5lcmF0aW9uIGZvciB0ZXN0cwogLSBNb3ZlIFNTRSBzcGVj
aWZpYyBmaWxlIGZyb20gbGliL3Jpc2N2IHRvIHJpc2N2LwoKVjM6CiAtIEFkZCAtZGVwcyB2YXJp
YWJsZSBmb3IgdGVzdCBzcGVjaWZpYyBkZXBlbmRlbmNpZXMKIC0gRml4IGZvcm1hdHRpbmcgZXJy
b3JzL3R5cG8gaW4gc2JpLmgKIC0gQWRkIG1pc3NpbmcgZG91YmxlIHRyYXAgZXZlbnQKIC0gQWxw
aGFiZXRpemUgc2JpLXNzZS5jIGluY2x1ZGVzCiAtIEZpeCBhNiBjb250ZW50IGFmdGVyIHVubWFz
a2luZyBldmVudAogLSBBZGQgU1NFIEhBUlRfTUFTSy9VTk1BU0sgdGVzdAogLSBVc2UgbXYgaW5z
dGVhZCBvZiBtb3ZlCiAtIG1vdmUgc2JpX2NoZWNrX3NzZSgpIGRlZmluaXRpb24gaW4gc2JpLmMK
IC0gUmVtb3ZlIHNiaV9zc2UgdGVzdCBmcm9tIHVuaXRlc3RzLmNmZwoKVjI6CiAtIFJlYmFzZWQg
b24gb3JpZ2luL21hc3RlciBhbmQgaW50ZWdyYXRlIGl0IGludG8gc2JpLmMgdGVzdHMKCkNsw6lt
ZW50IEzDqWdlciAoNik6CiAga2J1aWxkOiBBbGxvdyBtdWx0aXBsZSBhc20tb2Zmc2V0cyBmaWxl
IHRvIGJlIGdlbmVyYXRlZAogIHJpc2N2OiBTZXQgLmF1eC5vIGZpbGVzIGFzIC5QUkVDSU9VUwog
IHJpc2N2OiBVc2UgYXNtLW9mZnNldHMgdG8gZ2VuZXJhdGUgU0JJX0VYVF9IU00gdmFsdWVzCiAg
cmlzY3Y6IGxpYjogQWRkIFNCSSBTU0UgZXh0ZW5zaW9uIGRlZmluaXRpb25zCiAgbGliOiByaXNj
djogQWRkIFNCSSBTU0Ugc3VwcG9ydAogIHJpc2N2OiBzYmk6IEFkZCBTU0UgZXh0ZW5zaW9uIHRl
c3RzCgogc2NyaXB0cy9hc20tb2Zmc2V0cy5tYWsgfCAgIDIyICstCiByaXNjdi9NYWtlZmlsZSAg
ICAgICAgICB8ICAgIDUgKy0KIGxpYi9yaXNjdi9hc20vY3NyLmggICAgIHwgICAgMSArCiBsaWIv
cmlzY3YvYXNtL3NiaS5oICAgICB8ICAxNDQgKysrKy0KIGxpYi9yaXNjdi9zYmktc3NlLWFzbS5T
IHwgIDEwMyArKysrCiBsaWIvcmlzY3YvYXNtLW9mZnNldHMuYyB8ICAgIDkgKwogbGliL3Jpc2N2
L3NiaS5jICAgICAgICAgfCAgIDc2ICsrKwogcmlzY3Yvc2JpLXRlc3RzLmggICAgICAgfCAgICAx
ICsKIHJpc2N2L3NiaS1hc20uUyAgICAgICAgIHwgICAgNiArLQogcmlzY3Yvc2JpLWFzbS1vZmZz
ZXRzLmMgfCAgIDExICsKIHJpc2N2L3NiaS1zc2UuYyAgICAgICAgIHwgMTIxNSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHJpc2N2L3NiaS5jICAgICAgICAgICAgIHwg
ICAgMiArCiByaXNjdi8uZ2l0aWdub3JlICAgICAgICB8ICAgIDEgKwogMTMgZmlsZXMgY2hhbmdl
ZCwgMTU4NCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBsaWIvcmlzY3Yvc2JpLXNzZS1hc20uUwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2L3NiaS1h
c20tb2Zmc2V0cy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3Yvc2JpLXNzZS5jCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcmlzY3YvLmdpdGlnbm9yZQoKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
