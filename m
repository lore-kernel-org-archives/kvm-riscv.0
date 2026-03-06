Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B931FCB619
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D6AwWdRZhM47UpAa6CwB/HrJFbRrFyjZJyBeZxJjsCg=; b=WtSL6NqjoBcTgb
	jrVI+hFRbfHAkmmH3qXO6UPGKYURPT2eB60hqiOIX585EsFo6+itHs65RM+D+yn/xU+FPT/pI7Fn7
	Tir8glnGHsY29gtceK5RatRfYNhZU2jLUGA4I2Nm+QBUVZyZtn/ZgBrJj5GlWcstkpX/GTHkcJ7TI
	vxr2AtL6u3+PgTlensCHQkElApsknTX276OD7Dk4bDMqX+FoAwASHzTedagrDNF/WZPFnyL1WuS3C
	U/QjPA+LniBidGNhcp01anBvzGwAaWenDWQc+BzGPTAGp1SBbO10X+fC7Y1baYvdqn3PQla1ryM0r
	qxHD430kzpplBW7bfu+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXhA-000000047If-2S7E;
	Fri, 06 Mar 2026 16:06:32 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXh7-000000047He-1z5b
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 16:06:30 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7d556c1a79eso10882804a34.3
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 08:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772813188; cv=none;
        d=google.com; s=arc-20240605;
        b=WPJRRjwtAnZBssQGfmwrR8QHLpJ6wGrsLrL6RQF18EWV0iIPY+g6QvIPPx1zniBDpl
         Onpf13SNjy0SDF78ZwLijxCVYzjOOEmKLWfLC8yfJE3G8rA7mYpjfcuBKl0QrYcGPHkt
         pgHxJGoP2MPdsyLxeGbyfBmxvO7c58w2+m3NZA6OcEFCA1t0iJbAne9QGKydBfO6C2yr
         gGWAVePY0K7RzsUBaxWxfog3kju9SBPBSnPXSRrrBeUYTrUzvrKtFp16kcBpUbzM8mLy
         P+FAcKyXKm8aRhz9AX2ypehLIhzgQoBdBEBVqIIrtE8Amt48S2fYNG3oWzmbEN5NEDFB
         euYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=bq/d/mKtXxIR1+HyewF2kjtB/W3rkjxPeNkROtpkMok=;
        fh=LgPJ/TF7e6IFr8FcHapzXiepQjxQuDOJ+/ppga68j+Y=;
        b=PfB6Kdw8P4rufxI+PVvsaf5Qqigkyw3Iwybf2F0JDh9OzyAYnn0S0MGQeBzOUfjPsP
         gUAXSymqwiFzKCxUPHN7OCtj945SzKzGqrLV07AlAGr0wz8iCG2ju5K0cr2d6CRjSjpY
         dfZS5Nou5Ao0CpiSdUF825hdPkm+BvAreJWdOd9rWkcJd12seR4yXHhDPrQg8MAtT4mS
         kuFnQPNG++oXINencibupYG/4JyurqTX+DPm2LaB5ACwP+LgnTwiNBjp00CjrvH/N3RL
         T0Yu5nqGCb/NI1J1oJyxnUHTNVCRwEPTpq8KsnFVDhtAv0u5Kwmp+molGS6m9AOKlglh
         /RzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772813188; x=1773417988; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bq/d/mKtXxIR1+HyewF2kjtB/W3rkjxPeNkROtpkMok=;
        b=VOCI9kW/FEWDEOeoAIiEYwWUZPWyzca7/PGmPgx/xlppqk5zPLAGRDMXmygj4y+QCr
         YrofjtUJ+5Hs2Y4jVQJlfpCtCFnojEkjLduqcsww/6Q+acB7K7IUyXjqJqESrW3yklZD
         /My58RzIHT7/gSSuLr7USjOCuEm2u5btkF1n4dTbiWL6gg2VuTNmp4/yiq9LGQSPMyb7
         tygWI1HiYsKfqDs04sZjPZGW+SetftFLiZ7S7WY1gloFxFn0wVLT4x3tO4n2H6jI4oqE
         pNUv56ctlJSsC9Ih98GuDrjzIJamXvQ51LayBFg0eY0+zo6j5flH+9Ov/A1WdUUfBznE
         fQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813188; x=1773417988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq/d/mKtXxIR1+HyewF2kjtB/W3rkjxPeNkROtpkMok=;
        b=JjTMHmwa4auTlQ0vH/3M9HK7kW9f0Iw/e1kBxx0UlQXCfDAdeb52N8mtHCKTUOzrp2
         dTxMo+9XF3+urc6STkVxPkRWCPsK/lplWlkoNTHXrzwYoUCsjxImbygQHCOweKXfL3tV
         Cars4V0/1xQLDgB5CKPfkNZ8C8nJ1ch4DqgcyK20bC82yakJecFpq3N/Xrf/6FRDYdl/
         Yd6LaH1o/S43dJjkzXWI3iSZ7HYkRGc+xak3xXUNDTOc/eZUesn6/xr30c/bSvwN2/bA
         c5Qiehz7BEgflZ5b021QPaU5AVnyh2vDDlOkEtTEyX+UqrdWvqzIIuvwkFKMGWBMyjvA
         U6JA==
X-Forwarded-Encrypted: i=1; AJvYcCUSIhEYArKnzwbTeTL9bjhbI+Mok32+LT/g9HYxa8RGhZ5L9fOwhzNKItUW8Wb34H3CZsit2Qh/+GE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJRMUcvKwELts780wWEHtEjQxajS7XEiwu+lrBgvBa1n6ka6G0
	GbS0oSeH+uLYUWdK8WvNPQP3FncCxfz75jk6vJbVj5au42PCceftbKtGL0847wee3BJuOs/1PXW
	7PGBFoxVaVqiJPkqa7ZvN00jeb5YBP/V1O6DgibF4QQ==
X-Gm-Gg: ATEYQzyAh+QywLwlwvYfpPeXezq2mVapnyxRBPjZDlCLpzYvBKhF/EKLEVaiHhdpmDJ
	D0N+1lcqHGviK2IqKovL2aSkjckVEGJuW6gb8s7mWwvCZzRinOO1I4XJd92O+mVR8cAdaS3ZjkO
	530C9S1K82gzTLmsFi5pJApdfBW3+2Fxb9XbCoYU1aHA36sGPWuPUkaXSYEHChNlq+GixfwFpGE
	Cbg8UXJg5iVFa0JmDrvk4PRWov+tjiyeZycKLqquKd3hJJu9F5BPgLldVdmU4KawkEg2gM/nwof
	Lu1FKT5Bb8SU2YwD7tjDrfQUfldga8gLWdjfNIujDxG0yM7dU7MnY/XrFa59h+eiP9k9N0gTQp9
	WkSwbN0/qiGTwd+B6lJZIRjT/TpU=
X-Received: by 2002:a05:6820:1843:b0:679:f05e:f13c with SMTP id
 006d021491bc7-67b9bd45a8cmr1550538eaf.60.1772813187874; Fri, 06 Mar 2026
 08:06:27 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 21:36:16 +0530
X-Gm-Features: AaiRm53452UyUTlO6hp4cwRrPvadg006HyyZw7yrDpFC4S4tJGwcfOAoyhE4Kyg
Message-ID: <CAAhSdy2EuZu_KeZ1RaUEg3shtfSnSVo7eJWOA6-g4j9Hn2oY5A@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.0 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_080629_662275_C3B19B2C 
X-CRM114-Status: UNSURE (   7.23  )
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

SGkgUGFvbG8sCgpXZSBoYXZlIHF1aXRlIGEgZmV3IGZpeGVzIHRoaXMgdGltZSBmb3IgdGhlIDcu
MCBrZXJuZWwuClRoZXNlIGZpeGVzIGFkZHJlc3MgcG90ZW50aWFsIHVzZS1hZnRlci1mcmVlIGlz
c3VlcywgbnVsbApwb2ludGVyIGRlcmVmZXJlbmNlcywgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5k
IGFjY2Vzc2VzLAphbmQgb3RoZXJzLgoKUGxlYXNlIHB1bGwuCgpSZWdhcmRzLApBbnVwCgpUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDExNDM5YzQ2MzVlZGQ2NjlhZTQzNWVlYzMw
OGY0YWI4YTA4MDQ4MDg6CgogIExpbnV4IDcuMC1yYzIgKDIwMjYtMDMtMDEgMTU6Mzk6MzEgLTA4
MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9n
aXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtZml4ZXMtNy4wLTEK
CmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjNjFlYzNlOGNjNWQ0NmZhMjY5NDM0YTll
YzE2Y2EzNmQzNjJlMGRkOgoKICBSSVNDLVY6IEtWTTogQ2hlY2sgaG9zdCBTc2FpYSBleHRlbnNp
b24gd2hlbiBjcmVhdGluZyBBSUEgaXJxY2hpcAooMjAyNi0wMy0wNiAxMToyMDozMCArMDUzMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KS1ZNL3Jpc2N2IGZpeGVzIGZvciA3LjAsIHRha2UgIzEKCi0gUHJldmVudCBzcGVj
dWxhdGl2ZSBvdXQtb2YtYm91bmRzIGFjY2VzcyB1c2luZyBhcnJheV9pbmRleF9ub3NwZWMoKQog
IGluIEFQTElDIGludGVycnVwdCBoYW5kbGluZywgT05FX1JFRyByZWdpc2VyIGFjY2VzcywgQUlB
IENTUiBhY2Nlc3MsCiAgZmxvYXQgcmVnaXN0ZXIgYWNjZXNzLCBhbmQgUE1VIGNvdW50ZXIgYWNj
ZXNzCi0gRml4IHBvdGVudGlhbCB1c2UtYWZ0ZXItZnJlZSBpc3N1ZXMgaW4ga3ZtX3Jpc2N2X2dz
dGFnZV9nZXRfbGVhZigpLAogIGt2bV9yaXNjdl9haWFfYXBsaWNfaGFzX2F0dHIoKSwgYW5kIGt2
bV9yaXNjdl9haWFfaW1zaWNfaGFzX2F0dHIoKQotIEZpeCBwb3RlbnRpYWwgbnVsbCBwb2ludGVy
IGRlcmVmZXJlbmNlIGluIGt2bV9yaXNjdl92Y3B1X2FpYV9ybXdfdG9wZWkoKQotIEZpeCBvZmYt
Ynktb25lIGFycmF5IGFjY2VzcyBpbiBTQkkgUE1VCi0gU2tpcCBUSFAgc3VwcG9ydCBjaGVjayBk
dXJpbmcgZGlydHkgbG9nZ2luZwotIEZpeCBlcnJvciBjb2RlIHJldHVybmVkIGZvciBTbXN0YXRl
ZW4gYW5kIFNzYWlhIE9ORV9SRUcgaW50ZXJmYWNlCi0gQ2hlY2sgaG9zdCBTc2FpYSBleHRlbnNp
b24gd2hlbiBjcmVhdGluZyBBSUEgaXJxY2hpcAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbnVwIFBhdGVsICgzKToKICAg
ICAgUklTQy1WOiBLVk06IEZpeCBlcnJvciBjb2RlIHJldHVybmVkIGZvciBTbXN0YXRlZW4gT05F
X1JFRwogICAgICBSSVNDLVY6IEtWTTogRml4IGVycm9yIGNvZGUgcmV0dXJuZWQgZm9yIFNzYWlh
IE9ORV9SRUcKICAgICAgUklTQy1WOiBLVk06IENoZWNrIGhvc3QgU3NhaWEgZXh0ZW5zaW9uIHdo
ZW4gY3JlYXRpbmcgQUlBIGlycWNoaXAKCkppYWthaSBYdSAoNCk6CiAgICAgIFJJU0MtVjogS1ZN
OiBGaXggdXNlLWFmdGVyLWZyZWUgaW4ga3ZtX3Jpc2N2X2dzdGFnZV9nZXRfbGVhZigpCiAgICAg
IFJJU0MtVjogS1ZNOiBGaXggbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIGluCmt2bV9yaXNjdl92
Y3B1X2FpYV9ybXdfdG9wZWkoKQogICAgICBSSVNDLVY6IEtWTTogRml4IHVzZS1hZnRlci1mcmVl
IGluIGt2bV9yaXNjdl9haWFfYXBsaWNfaGFzX2F0dHIoKQogICAgICBSSVNDLVY6IEtWTTogRml4
IHBvdGVudGlhbCBVQUYgaW4ga3ZtX3Jpc2N2X2FpYV9pbXNpY19oYXNfYXR0cigpCgpMdWthcyBH
ZXJsYWNoICg1KToKICAgICAgS1ZNOiByaXNjdjogRml4IFNwZWN0cmUtdjEgaW4gQVBMSUMgaW50
ZXJydXB0IGhhbmRsaW5nCiAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIE9ORV9S
RUcgcmVnaXN0ZXIgYWNjZXNzCiAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIEFJ
QSBDU1IgYWNjZXNzCiAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIGZsb2F0aW5n
LXBvaW50IHJlZ2lzdGVyIGFjY2VzcwogICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBp
biBQTVUgY291bnRlciBhY2Nlc3MKClJhZGltIEtyxI1tw6HFmSAoMSk6CiAgICAgIFJJU0MtVjog
S1ZNOiBmaXggb2ZmLWJ5LW9uZSBhcnJheSBhY2Nlc3MgaW4gU0JJIFBNVQoKV2FuZyBZZWNoYW8g
KDEpOgogICAgICBSSVNDLVY6IEtWTTogU2tpcCBUSFAgc3VwcG9ydCBjaGVjayBkdXJpbmcgZGly
dHkgbG9nZ2luZwoKIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgfCAxNSArKysrKysrKysr
LS0KIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jICAgfCAyMyArKysrKysrKysrLS0tLS0tLS0t
CiBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgIHwgMTggKysrKysrKysrKystLS0tCiBhcmNo
L3Jpc2N2L2t2bS9haWFfaW1zaWMuYyAgIHwgIDQgKysrKwogYXJjaC9yaXNjdi9rdm0vbW11LmMg
ICAgICAgICB8ICA2ICsrKystCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X2ZwLmMgICAgIHwgMTcgKysr
KysrKysrKy0tLS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgfCA1NCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9w
bXUuYyAgICB8IDE2ICsrKysrKysrKy0tLS0KIDggZmlsZXMgY2hhbmdlZCwgMTA5IGluc2VydGlv
bnMoKyksIDQ0IGRlbGV0aW9ucygtKQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9rdm0tcmlzY3YK
