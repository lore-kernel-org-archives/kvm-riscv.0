Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BE9C282EC
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WJGg/Aj4DGSW6maBgj0y/2mVRD5kbgg/RP0f5dbbuzY=; b=yjDXVOzW793asd
	SmVyBPoZKwXgkdRefy8t7KIVl0dYW24AH1mo688FJTYzrab5Ea+2KPjTCuci088jVCWYUoEfG+W3m
	sGmCxLbOda79ZBXZN0s1nRM6A1ROgPtBA1Lwdz7eWa+8+4wTXlOjLHNBH6QZlk+hyaIjrD3uiMSYr
	XLaSKb0crkyOlNpyrttPiAyHa4gHYVNu2pwvssTOP/27tZoROwR+uQNInN2RSICKPLEFVnClqHgis
	7RTtBFNEwNV89Ca+fp/WCOTa0mHBy18pwj0A/qEX2fK8BI3/6dGrwXL2TTfxDPqSsyGgq+nZ3LEaa
	sRN3vEU+JpoT0JNq4f/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2xr-0000000DxwZ-0xkC;
	Fri, 14 Mar 2025 11:12:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2w1-0000000DxSt-2ztZ
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:10:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso18710955e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741950636; x=1742555436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7npoQ+lAZF+jhadyDUdozIqVWY5cY+s4DzjRASfiDo=;
        b=lPXdvRZ7vfWpSLeq1DajUViCRbgZZmT+HmnjcoD7P85XEM5eTKtoRw3o18aWSZXAjv
         mBs5GvOa6dQuEPJxcvcnta7RX36CPLUC6I1ZhVxeJNygAjjkKkLUngdPEI6El097hjvP
         PAjntJCm+M+f6r4eV9B4iZj7g3vr89YhLLgyeWJNOGTiAuS2yoqfXnhQpAahpMGwX9iq
         vwET23cAbvH9XennwvE33oxnjchoB8bTSucAcw8MTWJ3QVU5ugXOUbjzTt3+G+ds2XNW
         Jlw6o4TA+uowUKLuFpZV1C0UERwkrMiUkgZhcN0vKi+4nn6dOJVAJaFL2wQx6GKiKrvu
         gHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950636; x=1742555436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7npoQ+lAZF+jhadyDUdozIqVWY5cY+s4DzjRASfiDo=;
        b=LC1Mmo0SQYA7f/lBFOvaBwvPZ4anyXaCV1gx7sImyihNJi1X63Bud93O51VhBkz+iZ
         H2xMGJRpymwoQS37/SEGB2likuGWL3jSAT5hykg4saYGxVAmLFigdgDXLyeQO4GsBUJ8
         MzEvvA2JSzkp8BUjgs+rtQcNLeF/Xk9ygEk0cVfW2dTvLtBsmgZJr1XZHKFongoMiGy1
         7A82UBOd5Ycq5eez8SMr9XkE8IX3nx6sxKulZmFrKCqB7kwVLLpS2pIZHITakt0NQV6h
         YZMjzq1rwGcH+77lpMeV0vlEzihYWskmPL4fM7jWI3WiTVvxJUtGXRMARTUJJ74P3BYX
         X/uw==
X-Forwarded-Encrypted: i=1; AJvYcCUJx3AB3M8I/ir99wUnqdbzr+CAYfxBji9GideLY9ym9hDWEO1dcw+xjyYrFAdu7pBExRfyAbtj/X4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyOIsiuQS1lPui7aPBLqg6bTj2PbmESDOgB+qHnPPjrjw4/lT+
	hi+raQfCUozEHHtA0fKN9XQ7c5nkt5zbDtCwk/BvdvLKB4PVWH53w6O7T/fci4s=
X-Gm-Gg: ASbGncuQEYOQXmPumcL7U5NT2ZQUck9xnTOetUvl4LxhIVO2fCar/oylV7mXmdDGYyB
	/61B+fRkt7RYugiDtpQgvaFD3ikWZsFHmctCoZlM+lSNClaDPmRkTMgVDCXWAOftFJxJ/U7nmpM
	66VJyEoyWLSaJanah2FVa+1enOo1ov/8q2d7U2FvwFQ4CHcw66H4xg6q2FzjDfEeP9ehHx3PC6L
	NL0cjbNBM8Rwg5pz6HVqNeBATLmXNWmvJO1uqLzQez48slAQftcjDmlMJtih90pro7C6K0ieuKd
	BcOtDviWqiOY66bWnjvfFQhHM6TIV8IJE0M45FOM8AqZVw==
X-Google-Smtp-Source: AGHT+IG2zI60J3Qf9j4BDnR5L7rK81GHKTGeEIYHibpuXiVq5lNxg0JtPjrYedTVrFPgsRNi7D8V/A==
X-Received: by 2002:a05:600c:4fd4:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43d1ec8e682mr27038625e9.18.1741950635911;
        Fri, 14 Mar 2025 04:10:35 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb3188e8sm5299203f8f.65.2025.03.14.04.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:10:35 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v9 0/6] riscv: add SBI SSE extension tests
Date: Fri, 14 Mar 2025 12:10:23 +0100
Message-ID: <20250314111030.3728671-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041037_757184_D59C184D 
X-CRM114-Status: GOOD (  15.58  )
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
RUZJTkUgZnJvbSB0aGUgdGVzdCBkaXJlY3RvcnkuCgotLS0KClY5OgogLSBVc2UgX19BU1NFTUJM
RVJfXyBpbnN0ZWFkIG9mIF9fQVNTRU1CTFlfXwogLSBSZW1vdmUgZXh0cmEgc3BhY2VzCiAtIFVz
ZSBhc3NlcnQgdG8gY2hlY2sgZ2xvYmFsIGV2ZW50IGluCiAgIHNzZV9nbG9iYWxfZXZlbnRfc2V0
X2N1cnJlbnRfaGFydCgpCiAtIFRhYnVsYXRlIFNTRSBldmVudHMgbmFtZXMgdGFibGUKIC0gVXNl
IHNiaV9zc2VfcmVnaXN0ZXIoKSBpbnN0ZWFkIG9mIHNiaV9zc2VfcmVnaXN0ZXJfcmF3KCkgaW4g
ZXJyb3IKICAgdGVzdGluZwogLSBNb3ZlIGEgcmVwb3J0X3Bhc3MoKSBvdXQgb2YgZXJyb3IgcGF0
aAogLSBSZXdvcmsgYWxsIGluamVjdGlvbiB0ZXN0cyB3aXRoIGJldHRlciBlcnJvciBoYW5kbGlu
ZwogLSBVc2UgYW4gZW52IHZhciBmb3Igc3NlIGV2ZW50IGNvbXBsZXRpb24gdGltZW91dAogLSBB
ZGQgdGltZW91dCBmb3Igc29tZSBwb3RlbnRpYWxseSBpbmZpbml0ZSB3aGlsZSgpIGxvb3BzCgpW
ODoKIC0gU2hvcnQgY2lyY3VpdCBjdXJyZW50IGV2ZW50IHRlc3RzIGlmIGZhaWx1cmUgaGFwcGVu
cwogLSBSZW1vdmUgU1NFIGZyb20gYWxsIHJlcG9ydCBzdHJpbmdzCiAtIEluZGVudCAucHJpbyBm
aWVsZAogLSBBZGQgY3B1X3JlbGF4KCkvc21wX3JtYigpIHdoZXJlIG5lZWRlZAogLSBBZGQgdGlt
ZW91dCBmb3IgZ2xvYmFsIGV2ZW50IEVOQUJMRUQgc3RhdGUgY2hlY2sKIC0gQWRkZWQgQklUKDMy
KSBhbGlhc2VzIHRlc3RzIGZvciBhdHRyaWJ1dGUvZXZlbnRfaWQuCgpWNzoKIC0gVGVzdCBpZHMv
YXR0cmlidXRlcy9hdHRyaWJ1dGVzIGNvdW50ID4gMzIgYml0cwogLSBSZW5hbWUgYWxsIFNTRSBm
dW5jdGlvbiB0byBzYmlfc3NlXyoKIC0gVXNlIGV2ZW50X2lkIGluc3RlYWQgb2YgZXZlbnQvZXZ0
CiAtIEZhY3Rvcml6ZSByZWFkL3dyaXRlIHRlc3QKIC0gVXNlIHZpcnRfdG9fcGh5cygpIGZvciBh
dHRyaWJ1dGVzIHJlYWQvd3JpdGUuCiAtIEV4dGVuc2l2ZWx5IHVzZSBzYmlyZXRfcmVwb3J0X2Vy
cm9yKCkKIC0gQ2hhbmdlIGNoZWNrIGZ1bmN0aW9uIHJldHVybiB2YWx1ZXMgdG8gYm9vbC4KIC0g
QWRkZWQgYXNzZXJ0IGZvciBzdGFjayBzaXplIHRvIGJlIGJlbG93IG9yIGVxdWFsIHRvIFBBR0Vf
U0laRQogLSBVc2UgZW4gZW52IHZhcmlhYmxlIGZvciB0aGUgbWF4aW11bSBoYXJ0IElECiAtIENo
ZWNrIHRoYXQgaW5kaXZpZHVhbCByZWFkIGZyb20gYXR0cmlidXRlcyBtYXRjaGVzIHRoZSBtdWx0
aXBsZQogICBhdHRyaWJ1dGVzIHJlYWQuCiAtIEFkZGVkIG11bHRpcGxlIGF0dHJpYnV0ZXMgd3Jp
dGUgYXQgb25jZQogLSBVc2VkIFJFQURfT05DRS9XUklURV9PTkNFCiAtIEluamVjdCBhbGwgbG9j
YWwgZXZlbnQgYXQgb25jZSByYXRoZXIgdGhhbiBsb29waW5nIGZvcHIgZWFjaCBjb3JlLgogLSBT
cGxpdCB0ZXN0X2FyZyBmb3IgbG9jYWxfZGlzcGF0Y2ggdGVzdCBzbyB0aGF0IGFsbCBDUFVzIGNh
biBydW4gYXQKICAgb25jZS4KIC0gTW92ZSBTU0UgZW50cnkgYW5kIGdlbmVyaWMgY29kZSB0byBs
aWIvcmlzY3YgZm9yIG90aGVyIHRlc3RzCiAtIEZpeCB1bm1hc2svbWFzayBzdGF0ZSBjaGVja2lu
ZwoKVjY6CiAtIEFkZCBtaXNzaW5nICQoZ2VuZXJhdGVkLWZpbGUpIGRlcGVuZGVuY2llcyBmb3Ig
Ii1kZXBzIiBvYmplY3RzCiAtIFNwbGl0IFNTRSBlbnRyeSBmcm9tIHNiaS1hc20uUyB0byBzc2Ut
YXNtLlMgYW5kIGFsbCBTU0UgY29yZSBmdW5jdGlvbnMKICAgc2luY2UgaXQgd2lsbCBiZSB1c2Vm
dWwgZm9yIG90aGVyIHRlc3RzIGFzIHdlbGwgKGRibHRycCkuCgpWNToKIC0gVXBkYXRlIGV2ZW50
IHJhbmdlcyBiYXNlZCBvbiBsYXRlc3Qgc3BlYwogLSBSZW5hbWUgYXNtLW9mZnNldC10ZXN0LmMg
dG8gc2JpLWFzbS1vZmZzZXQuYwoKVjQ6CiAtIEZpeCB0eXBvIHNiaV9leHRfc3NfZmlkIC0+IHNi
aV9leHRfc3NlX2ZpZAogLSBBZGQgcHJvcGVyIGFzbS1vZmZzZXQgZ2VuZXJhdGlvbiBmb3IgdGVz
dHMKIC0gTW92ZSBTU0Ugc3BlY2lmaWMgZmlsZSBmcm9tIGxpYi9yaXNjdiB0byByaXNjdi8KClYz
OgogLSBBZGQgLWRlcHMgdmFyaWFibGUgZm9yIHRlc3Qgc3BlY2lmaWMgZGVwZW5kZW5jaWVzCiAt
IEZpeCBmb3JtYXR0aW5nIGVycm9ycy90eXBvIGluIHNiaS5oCiAtIEFkZCBtaXNzaW5nIGRvdWJs
ZSB0cmFwIGV2ZW50CiAtIEFscGhhYmV0aXplIHNiaS1zc2UuYyBpbmNsdWRlcwogLSBGaXggYTYg
Y29udGVudCBhZnRlciB1bm1hc2tpbmcgZXZlbnQKIC0gQWRkIFNTRSBIQVJUX01BU0svVU5NQVNL
IHRlc3QKIC0gVXNlIG12IGluc3RlYWQgb2YgbW92ZQogLSBtb3ZlIHNiaV9jaGVja19zc2UoKSBk
ZWZpbml0aW9uIGluIHNiaS5jCiAtIFJlbW92ZSBzYmlfc3NlIHRlc3QgZnJvbSB1bml0ZXN0cy5j
ZmcKClYyOgogLSBSZWJhc2VkIG9uIG9yaWdpbi9tYXN0ZXIgYW5kIGludGVncmF0ZSBpdCBpbnRv
IHNiaS5jIHRlc3RzCgpDbMOpbWVudCBMw6lnZXIgKDYpOgogIGtidWlsZDogQWxsb3cgbXVsdGlw
bGUgYXNtLW9mZnNldHMgZmlsZSB0byBiZSBnZW5lcmF0ZWQKICByaXNjdjogU2V0IC5hdXgubyBm
aWxlcyBhcyAuUFJFQ0lPVVMKICByaXNjdjogVXNlIGFzbS1vZmZzZXRzIHRvIGdlbmVyYXRlIFNC
SV9FWFRfSFNNIHZhbHVlcwogIHJpc2N2OiBsaWI6IEFkZCBTQkkgU1NFIGV4dGVuc2lvbiBkZWZp
bml0aW9ucwogIGxpYjogcmlzY3Y6IEFkZCBTQkkgU1NFIHN1cHBvcnQKICByaXNjdjogc2JpOiBB
ZGQgU1NFIGV4dGVuc2lvbiB0ZXN0cwoKIHNjcmlwdHMvYXNtLW9mZnNldHMubWFrIHwgICAyMiAr
LQogcmlzY3YvTWFrZWZpbGUgICAgICAgICAgfCAgICA1ICstCiBsaWIvcmlzY3YvYXNtL2Nzci5o
ICAgICB8ICAgIDEgKwogbGliL3Jpc2N2L2FzbS9zYmkuaCAgICAgfCAgMTQyICsrKystCiBsaWIv
cmlzY3Yvc2JpLXNzZS1hc20uUyB8ICAxMDIgKysrKwogbGliL3Jpc2N2L2FzbS1vZmZzZXRzLmMg
fCAgICA5ICsKIGxpYi9yaXNjdi9zYmkuYyAgICAgICAgIHwgICA3NiArKysKIHJpc2N2L3NiaS10
ZXN0cy5oICAgICAgIHwgICAgMSArCiByaXNjdi9zYmktYXNtLlMgICAgICAgICB8ICAgIDYgKy0K
IHJpc2N2L3NiaS1hc20tb2Zmc2V0cy5jIHwgICAxMSArCiByaXNjdi9zYmktc3NlLmMgICAgICAg
ICB8IDEyNjMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiByaXNjdi9z
YmkuYyAgICAgICAgICAgICB8ICAgIDIgKwogcmlzY3YvLmdpdGlnbm9yZSAgICAgICAgfCAgICAx
ICsKIDEzIGZpbGVzIGNoYW5nZWQsIDE2MzAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3Jpc2N2L3NiaS1zc2UtYXNtLlMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCByaXNjdi9zYmktYXNtLW9mZnNldHMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2
L3NiaS1zc2UuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2Ly5naXRpZ25vcmUKCi0tIAoyLjQ3
LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
