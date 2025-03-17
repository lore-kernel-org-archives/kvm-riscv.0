Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB81C35FF3
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nfWYVoh01sNVl8HY96kP8zuxTN3m+aBtBB6sI+DAF4g=; b=rHX2RpsOior+Ep
	524SCiJEgAYFXPnGK2zcZYpCgnQ5UwJKR0nHy/YgPvA8/2LJdJiKcmmDX5TUBq0Y70rRILmU3LXEC
	byA3GAjr58l4CkNlFKVbGogDPuJTJcWzgIs8fFuhgBJBoUH+tssvKnP86GguGsyG+EK0w1KUioODk
	Id63YFrq9bxBguA3disq8XLQP75OZ8Kw+01jBF+E/Zn16tXjeXkfv7upiEJDXYWjHU66H6eJtpKHp
	v/nJRv2geB+5T/WLHw2SAPC2SCMqFipZdR3i9pR0P9bD0HOWkcm61ZP3ji18EDnYeQQADO3rEdbhS
	IM/nQ3M0N/7gqhrTkKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDep-00000003Ovu-0Mir;
	Mon, 17 Mar 2025 16:49:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDem-00000003Oue-0QPM
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:49:41 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-39130ee05b0so4555398f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742230178; x=1742834978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7ZptfcVywAs5S9WPv2/GeL62BfGTfGlQVZZ9GYrYds=;
        b=dY3HtZ1PGXjwe3cZd2nEcrWJXnHQzSnxcVxvJz/j6mQJ14DJsGLjVKViTUv+aMy7OZ
         qxCotCG9XK/yDxrVWVKVg9wEAOEa+IlFU4AEtBRjXIFI7i4er9xIE52W9itJQ0ssojCg
         RsaklBVL33Y6wk3Nx1N4pmRZLeKQIEyB1KHZXIFk9v5HXsoEQiOVM32BF0PL7LDp48qJ
         mZPLzoJApKO3UB/JIyoj9NbyXzhtTTE17+fzyUzphuNSh2lP3Ahga+O5lDXgG1aCAJbz
         OuFhVFAPnu1RJJENDJwiqGhgFsCImkgCcCUD2Oja/h6qMwlv4ZLNKxQDzRdSMhd7RGA0
         Mtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742230178; x=1742834978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7ZptfcVywAs5S9WPv2/GeL62BfGTfGlQVZZ9GYrYds=;
        b=Hew6ZEToMhngEVd/96IVdIklxomobM6L9+xoev7QtT64g8y/C5WUtZsV7ZXL7N6WKt
         5r5yCqlh2fM2L43J7lgDmnaoCDxvafuOOIUbKHXLDSVfudlqOjTRn0Q1FxLyxtC4B7/s
         bLn0W+p065z8GfD2iGxjuV2RJPNm+SmXDUzqGoQR3B9Y0Jk9F0uSYeZTLoTv5i3hTtfb
         bscMFHo+AeST36TPROeeqcnw8xgiucxqHg6lTHYFUNuVEYsFaBeRIf1buj3E1IPvNRkb
         eOvbitLgRP0OS42uamr8g0jO9LkFQggleR50jPs35IosXyQ8xhB+M3ceWGEJl42ZCue7
         bKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGUO2k71dbQ46VUw92q2wgCkK4/3p48QwDYKPMHjSXL7QhcOUh118GlA90q0E1JD560ngV22e2uys=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrwox3eTgMfS9wCXp13+6SmcIrq6idTb71fvfTThGx8dWd2zV6
	YHUiwLM0A9N7jTzzkG2AkmOJFgjBMa4BFh5052lytxPLRK/aOjHo2+ABvb5n8Ts=
X-Gm-Gg: ASbGncuXrVBRtZ+SOC2FsLqJPSAqRgIrwX9XimBABlRAUGtF09fYBq/XDMQlFaXUGT9
	5gYZ2iEGIHCPXIRj8MvA4gF7Ij1/tXyV+pbjBjhlaYEEvP31R0ZOSWiF9nTgEkGFpbAtz54RhWA
	5jp3Gn+3lnTK64feQYfyV9+6rkQgh2S2YbZfdsIRidH09xS4JHsgnPFUgUzu2M6Jeo4+3VQ/Rn1
	YYJzvCHU79d8RSI9+MmKBzl3ocggsefMiHOW8te5S2aHBfYbr1TfSs9xUvlQ+74Zi48Hab8GhLL
	DmocviudLx06EHYaEX0l+BuZTrMln9FKumlYmq/sfqGHsg==
X-Google-Smtp-Source: AGHT+IFvFLEtNts4+EjupQj7tKz7Ub/sfS5CRz526ULsf0t9rBwSNgpmM3LhpFRnB8TblPnkZ0kchg==
X-Received: by 2002:a5d:47ac:0:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3971f9e7813mr13297922f8f.47.1742230178319;
        Mon, 17 Mar 2025 09:49:38 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a80sm15785845f8f.61.2025.03.17.09.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 09:49:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v11 0/8] riscv: add SBI SSE extension tests
Date: Mon, 17 Mar 2025 17:46:45 +0100
Message-ID: <20250317164655.1120015-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094940_344714_C7A1A984 
X-CRM114-Status: GOOD (  16.93  )
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
RUZJTkUgZnJvbSB0aGUgdGVzdCBkaXJlY3RvcnkuCgpUaGVzZSB0ZXN0cyBjYW4gYmUgcnVuIHVz
aW5nIGFuIE9wZW5TQkkgdmVyc2lvbiB0aGF0IGltcGxlbWVudHMgbGF0ZXN0CnNwZWNpZmljYXRp
b25zIG1vZGlmaWNhdGlvbiBbMV0KCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXZvc2luYy9v
cGVuc2JpL3RyZWUvZGV2L2NsZWdlci9zc2UgWzFdCgotLS0KClYxMToKIC0gVXNlIG1hc2sgaW5z
aWRlIHNiaV9pbXBsX29wZW5zYmlfbWtfdmVyc2lvbigpCiAtIE1hc2sgdGhlIFNCSSB2ZXJzaW9u
IHdpdGggYSBuZXcgbWFzawogLSBVc2UgYXNzZXJ0IGluc2lkZSBzYmlfZ2V0X2ltcGxfaWQvdmVy
c2lvbigpCiAtIFJlbW92ZSBzYmlfY2hlY2tfaW1wbCgpCiAtIEluY3JlYXNlIGNvbXBsZXRpb24g
dGltZW91dCBhcyBldmVudHMgZmFpbGVkIGNvbXBsZXRpbmcgdW5kZXIgMTAwMAogICBtaWNyb3Mg
d2hlbiBzeXN0ZW0gaXMgbG9hZGVkLgoKVjEwOgogLSBVc2UgJiYgaW5zdGVhZCBvZiB8fCBmb3Ig
dGltZW91dCBoYW5kbGluZwogLSBBZGQgU0JJIHBhdGNoZXMgd2hpY2ggaW50cm9kdWNlIGZ1bmN0
aW9uIHRvIGdldCBpbXBsZW1lbnRlciBJRCBhbmQKICAgdmVyc2lvbiBhcyB3ZWxsIGFzIGltcGxl
bWVudGVyIElEIGRlZmluZXMuCiAtIFNraXAgaW5qZWN0aW9uIHRlc3RzIGluIE9wZW5TQkkgPCB2
MS42CgpWOToKIC0gVXNlIF9fQVNTRU1CTEVSX18gaW5zdGVhZCBvZiBfX0FTU0VNQkxZX18KIC0g
UmVtb3ZlIGV4dHJhIHNwYWNlcwogLSBVc2UgYXNzZXJ0IHRvIGNoZWNrIGdsb2JhbCBldmVudCBp
bgogICBzc2VfZ2xvYmFsX2V2ZW50X3NldF9jdXJyZW50X2hhcnQoKQogLSBUYWJ1bGF0ZSBTU0Ug
ZXZlbnRzIG5hbWVzIHRhYmxlCiAtIFVzZSBzYmlfc3NlX3JlZ2lzdGVyKCkgaW5zdGVhZCBvZiBz
Ymlfc3NlX3JlZ2lzdGVyX3JhdygpIGluIGVycm9yCiAgIHRlc3RpbmcKIC0gTW92ZSBhIHJlcG9y
dF9wYXNzKCkgb3V0IG9mIGVycm9yIHBhdGgKIC0gUmV3b3JrIGFsbCBpbmplY3Rpb24gdGVzdHMg
d2l0aCBiZXR0ZXIgZXJyb3IgaGFuZGxpbmcKIC0gVXNlIGFuIGVudiB2YXIgZm9yIHNzZSBldmVu
dCBjb21wbGV0aW9uIHRpbWVvdXQKIC0gQWRkIHRpbWVvdXQgZm9yIHNvbWUgcG90ZW50aWFsbHkg
aW5maW5pdGUgd2hpbGUoKSBsb29wcwoKVjg6CiAtIFNob3J0IGNpcmN1aXQgY3VycmVudCBldmVu
dCB0ZXN0cyBpZiBmYWlsdXJlIGhhcHBlbnMKIC0gUmVtb3ZlIFNTRSBmcm9tIGFsbCByZXBvcnQg
c3RyaW5ncwogLSBJbmRlbnQgLnByaW8gZmllbGQKIC0gQWRkIGNwdV9yZWxheCgpL3NtcF9ybWIo
KSB3aGVyZSBuZWVkZWQKIC0gQWRkIHRpbWVvdXQgZm9yIGdsb2JhbCBldmVudCBFTkFCTEVEIHN0
YXRlIGNoZWNrCiAtIEFkZGVkIEJJVCgzMikgYWxpYXNlcyB0ZXN0cyBmb3IgYXR0cmlidXRlL2V2
ZW50X2lkLgoKVjc6CiAtIFRlc3QgaWRzL2F0dHJpYnV0ZXMvYXR0cmlidXRlcyBjb3VudCA+IDMy
IGJpdHMKIC0gUmVuYW1lIGFsbCBTU0UgZnVuY3Rpb24gdG8gc2JpX3NzZV8qCiAtIFVzZSBldmVu
dF9pZCBpbnN0ZWFkIG9mIGV2ZW50L2V2dAogLSBGYWN0b3JpemUgcmVhZC93cml0ZSB0ZXN0CiAt
IFVzZSB2aXJ0X3RvX3BoeXMoKSBmb3IgYXR0cmlidXRlcyByZWFkL3dyaXRlLgogLSBFeHRlbnNp
dmVseSB1c2Ugc2JpcmV0X3JlcG9ydF9lcnJvcigpCiAtIENoYW5nZSBjaGVjayBmdW5jdGlvbiBy
ZXR1cm4gdmFsdWVzIHRvIGJvb2wuCiAtIEFkZGVkIGFzc2VydCBmb3Igc3RhY2sgc2l6ZSB0byBi
ZSBiZWxvdyBvciBlcXVhbCB0byBQQUdFX1NJWkUKIC0gVXNlIGVuIGVudiB2YXJpYWJsZSBmb3Ig
dGhlIG1heGltdW0gaGFydCBJRAogLSBDaGVjayB0aGF0IGluZGl2aWR1YWwgcmVhZCBmcm9tIGF0
dHJpYnV0ZXMgbWF0Y2hlcyB0aGUgbXVsdGlwbGUKICAgYXR0cmlidXRlcyByZWFkLgogLSBBZGRl
ZCBtdWx0aXBsZSBhdHRyaWJ1dGVzIHdyaXRlIGF0IG9uY2UKIC0gVXNlZCBSRUFEX09OQ0UvV1JJ
VEVfT05DRQogLSBJbmplY3QgYWxsIGxvY2FsIGV2ZW50IGF0IG9uY2UgcmF0aGVyIHRoYW4gbG9v
cGluZyBmb3ByIGVhY2ggY29yZS4KIC0gU3BsaXQgdGVzdF9hcmcgZm9yIGxvY2FsX2Rpc3BhdGNo
IHRlc3Qgc28gdGhhdCBhbGwgQ1BVcyBjYW4gcnVuIGF0CiAgIG9uY2UuCiAtIE1vdmUgU1NFIGVu
dHJ5IGFuZCBnZW5lcmljIGNvZGUgdG8gbGliL3Jpc2N2IGZvciBvdGhlciB0ZXN0cwogLSBGaXgg
dW5tYXNrL21hc2sgc3RhdGUgY2hlY2tpbmcKClY2OgogLSBBZGQgbWlzc2luZyAkKGdlbmVyYXRl
ZC1maWxlKSBkZXBlbmRlbmNpZXMgZm9yICItZGVwcyIgb2JqZWN0cwogLSBTcGxpdCBTU0UgZW50
cnkgZnJvbSBzYmktYXNtLlMgdG8gc3NlLWFzbS5TIGFuZCBhbGwgU1NFIGNvcmUgZnVuY3Rpb25z
CiAgIHNpbmNlIGl0IHdpbGwgYmUgdXNlZnVsIGZvciBvdGhlciB0ZXN0cyBhcyB3ZWxsIChkYmx0
cnApLgoKVjU6CiAtIFVwZGF0ZSBldmVudCByYW5nZXMgYmFzZWQgb24gbGF0ZXN0IHNwZWMKIC0g
UmVuYW1lIGFzbS1vZmZzZXQtdGVzdC5jIHRvIHNiaS1hc20tb2Zmc2V0LmMKClY0OgogLSBGaXgg
dHlwbyBzYmlfZXh0X3NzX2ZpZCAtPiBzYmlfZXh0X3NzZV9maWQKIC0gQWRkIHByb3BlciBhc20t
b2Zmc2V0IGdlbmVyYXRpb24gZm9yIHRlc3RzCiAtIE1vdmUgU1NFIHNwZWNpZmljIGZpbGUgZnJv
bSBsaWIvcmlzY3YgdG8gcmlzY3YvCgpWMzoKIC0gQWRkIC1kZXBzIHZhcmlhYmxlIGZvciB0ZXN0
IHNwZWNpZmljIGRlcGVuZGVuY2llcwogLSBGaXggZm9ybWF0dGluZyBlcnJvcnMvdHlwbyBpbiBz
YmkuaAogLSBBZGQgbWlzc2luZyBkb3VibGUgdHJhcCBldmVudAogLSBBbHBoYWJldGl6ZSBzYmkt
c3NlLmMgaW5jbHVkZXMKIC0gRml4IGE2IGNvbnRlbnQgYWZ0ZXIgdW5tYXNraW5nIGV2ZW50CiAt
IEFkZCBTU0UgSEFSVF9NQVNLL1VOTUFTSyB0ZXN0CiAtIFVzZSBtdiBpbnN0ZWFkIG9mIG1vdmUK
IC0gbW92ZSBzYmlfY2hlY2tfc3NlKCkgZGVmaW5pdGlvbiBpbiBzYmkuYwogLSBSZW1vdmUgc2Jp
X3NzZSB0ZXN0IGZyb20gdW5pdGVzdHMuY2ZnCgpWMjoKIC0gUmViYXNlZCBvbiBvcmlnaW4vbWFz
dGVyIGFuZCBpbnRlZ3JhdGUgaXQgaW50byBzYmkuYyB0ZXN0cwoKQ2zDqW1lbnQgTMOpZ2VyICg4
KToKICBrYnVpbGQ6IEFsbG93IG11bHRpcGxlIGFzbS1vZmZzZXRzIGZpbGUgdG8gYmUgZ2VuZXJh
dGVkCiAgcmlzY3Y6IFNldCAuYXV4Lm8gZmlsZXMgYXMgLlBSRUNJT1VTCiAgcmlzY3Y6IFVzZSBh
c20tb2Zmc2V0cyB0byBnZW5lcmF0ZSBTQklfRVhUX0hTTSB2YWx1ZXMKICBsaWI6IHJpc2N2OiBB
ZGQgZnVuY3Rpb25zIGZvciB2ZXJzaW9uIGNoZWNraW5nCiAgbGliOiByaXNjdjogQWRkIGZ1bmN0
aW9ucyB0byBnZXQgaW1wbGVtZW50ZXIgSUQgYW5kIHZlcnNpb24KICByaXNjdjogbGliOiBBZGQg
U0JJIFNTRSBleHRlbnNpb24gZGVmaW5pdGlvbnMKICBsaWI6IHJpc2N2OiBBZGQgU0JJIFNTRSBz
dXBwb3J0CiAgcmlzY3Y6IHNiaTogQWRkIFNTRSBleHRlbnNpb24gdGVzdHMKCiBzY3JpcHRzL2Fz
bS1vZmZzZXRzLm1hayB8ICAgMjIgKy0KIHJpc2N2L01ha2VmaWxlICAgICAgICAgIHwgICAgNSAr
LQogbGliL3Jpc2N2L2FzbS9jc3IuaCAgICAgfCAgICAxICsKIGxpYi9yaXNjdi9hc20vc2JpLmgg
ICAgIHwgIDE3NyArKysrKy0KIGxpYi9yaXNjdi9zYmktc3NlLWFzbS5TIHwgIDEwMiArKysrCiBs
aWIvcmlzY3YvYXNtLW9mZnNldHMuYyB8ICAgIDkgKwogbGliL3Jpc2N2L3NiaS5jICAgICAgICAg
fCAgMTA1ICsrKy0KIHJpc2N2L3NiaS10ZXN0cy5oICAgICAgIHwgICAgMSArCiByaXNjdi9zYmkt
YXNtLlMgICAgICAgICB8ICAgIDYgKy0KIHJpc2N2L3NiaS1hc20tb2Zmc2V0cy5jIHwgICAxMSAr
CiByaXNjdi9zYmktc3NlLmMgICAgICAgICB8IDEyNzggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiByaXNjdi9zYmkuYyAgICAgICAgICAgICB8ICAgIDIgKwogcmlzY3Yv
LmdpdGlnbm9yZSAgICAgICAgfCAgICAxICsKIDEzIGZpbGVzIGNoYW5nZWQsIDE3MDcgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3Jpc2N2L3Ni
aS1zc2UtYXNtLlMKIGNyZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi9zYmktYXNtLW9mZnNldHMuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2L3NiaS1zc2UuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJp
c2N2Ly5naXRpZ25vcmUKCi0tIAoyLjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
