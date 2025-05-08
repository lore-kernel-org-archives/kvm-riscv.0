Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1F7C3ABBE
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdK8usYYqxPj5cRmdXw2es1OLLWTNTUgi363EyJ+nqQ=; b=lRiEI1r4ZPXAYG
	6iv5ORdqUBWBXsU41I/4GXI0s8NHks1yuHbFfCVA7O+ca1sCYnSVNRpWV3znm8e26LNrZ1IrDw4Qq
	QpDGnAY5Auc14qKDE8PD9ryBBB2sAY9oA9iyfCe63erxAfffvAMjn9RTXfKQWrEMttukuKnP+j5Lk
	9CThW8XWIofPTqRMC3tO/StAo/kCmvC12tzJrlGsurLUQ/UXu9xgv8M0YOWHFE6V9HNQknxtEI1wB
	2xkJG1W4GvTk3uIQI/qs/zqe16zABa8g0GUfR+bfm5s4ISsub5AbqzgYV/CbCJZfJIUMpt3p7FiZJ
	upnK+oKkbBw2QPYvw4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwlM-000000008YK-3Jwz;
	Thu, 08 May 2025 08:37:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwXK-000000006AH-1VKa
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 08:23:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43edb40f357so4141405e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 01:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746692601; x=1747297401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=3TGj89K0n/wUDMvSWtdHdSm0v7GSMWc0jLVtb/oR/xYUGMriJyrcT+eNRgTPA5/3KH
         OA79qoZkwEJXctRIPE4IwYsFaTx8EduGBV3eOQpPR/NL6NV/D/G1gm7EJPZd09n2d+Z9
         tMWfkr/94wNG58fmIcZGN18+DOSA/3CY+qLIoOb9aAZtzBgC+L4GGrNHnLN3w7+VrD9y
         +1dFWpvXrV9BKKdHb+VEz6jqbx1MC5/qZGkrqHW1vaM0r/2xeoID1C9+vbX4LZnX6QsM
         jAB1yEZ2FbbHChZzRjiqK3ZweIiTOJ5NHCe6UC/ofZ2IDVklZBUJJQHnlLtjZViIoIx/
         MOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692601; x=1747297401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vh7Nh/LNhUg5Xl+qiW1/QFk8dwafIYEiWF4enwv0UK4=;
        b=NW/7CE/GwjYbM7zVphKJ3/0xOWzSx+C6TNyDZW0bw5b7TQv1JZoCoBCeBCuypwUJoN
         6DWidB+rCPUEsL8eu8mVdHHwtXtj69diaaka+vMnmfFbSNY7friPHQgC80nG4H7tkbp5
         aOC7gIgy2smUYN9SopMLelL8Y6fOy/PTcBID7xF00oUikCOUyBM02p26ipyHHSwx6C/D
         7JDTUwXs77znNqtlI5PneRVqLcs6bEv4AtQ7KRX7nwkOHSBPeG+n7XFDO8/HEwM2H4lQ
         I4zQsU19PmhnndYYWp4ndhNaLPm7s3Vxaetm4ArYyyZSN+PZxR8qiRl4WLZQGNPShV0a
         FUQA==
X-Forwarded-Encrypted: i=1; AJvYcCV0PbPrFtiGcpbUzq4VKs0fMn1LIxgMH9aNOpZd1pOl4UKarYOjsj/9BbSKEnbyJ5aJc6GFetoKuYc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnybAiwMnjUZwg9rtqkp3FTaZNN5+VdMk7f6hpoCQKCcEJwcGO
	tqdAJz5x7JT8gxZjsIS/OE7M4qNMF6HfIC7PoQ9NyL8bNC5bFEsNbwppt4ljw+0=
X-Gm-Gg: ASbGncupe4WeD7JqTZiod53w9mjxixag+vr9An/fEzx0fd7FmxqXguRRI270qZb6Z5z
	q6lDSgNg3TsgJTM4uZhZ4wjhhY8RJC5ntlK1/gjo4+weszLC1hnEaMlB3Y6dxPqTSlTkVbeafoB
	vHCWDlb0DcYAJMDs+UF6nptAoThSbF6MICBCl4aUaNTCoECCm41sNaBGOVIYWPAgRKZ6rStW9z7
	y0JPVFdHhtF7MBIiSZHbcb0zE3xIkuo34xxbapqgV2ZIPtKP3PAo03u489o9bMZ0NncKGJgHco/
	EwLdHuAzoEJeAPzHEjNbBsjNO/2e4Jm43/lv15zi+gQpx/NnR2wifuUEVUI/OQ==
X-Google-Smtp-Source: AGHT+IEaepCUF0s1jaV8f2x9+3A/ICFXfGBKrXbBRgf8EnrZFcBImB0rnl0HY1gtvoGRDu1Jbp/ttg==
X-Received: by 2002:a05:600c:4e16:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-441d44bb815mr54224835e9.2.1746692600740;
        Thu, 08 May 2025 01:23:20 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:e3eb:2939:f761:f7f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f331sm28697035e9.13.2025.05.08.01.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:23:20 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Thu,  8 May 2025 10:22:13 +0200
Message-Id: <20250508082215.88658-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250508082215.88658-1-alexghiti@rivosinc.com>
References: <20250508082215.88658-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_012322_390819_4BA87535 
X-CRM114-Status: GOOD (  10.89  )
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

U2ltcGx5IGZpeCBhIHR5cG8uCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oIHwgMiArLQog
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2luc24uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oCmluZGV4IDA5
ZmRlOTVhNWU4Zi4uMmE1ODlhNThiMjkxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2luc24uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaApAQCAtMzUyLDcg
KzM1Miw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9pbnNuX2lzX2NfamFs
cih1MzIgY29kZSkKIAkoe3R5cGVvZih4KSB4XyA9ICh4KTsgUlZfWCh4XywgUlZGRFFfRkxfRlNf
V0lEVEhfT0ZGLCBcCiAJCQkJICAgUlZGRFFfRkxfRlNfV0lEVEhfTUFTSyk7IH0pCiAKLSNkZWZp
bmUgUlZWX0VYUkFDVF9WTF9WU19XSURUSCh4KSBSVkZEUV9FWFRSQUNUX0ZMX0ZTX1dJRFRIKHgp
CisjZGVmaW5lIFJWVl9FWFRSQUNUX1ZMX1ZTX1dJRFRIKHgpIFJWRkRRX0VYVFJBQ1RfRkxfRlNf
V0lEVEgoeCkKIAogLyoKICAqIEdldCB0aGUgaW1tZWRpYXRlIGZyb20gYSBKLXR5cGUgaW5zdHJ1
Y3Rpb24uCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3ZlY3Rvci5jCmluZGV4IDE4NGY3ODBjOTMyZC4uOTAxZTY3YWRmNTc2IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC92ZWN0b3IuYwpAQCAtOTMsNyArOTMsNyBAQCBib29sIGluc25faXNfdmVjdG9yKHUzMiBpbnNu
X2J1ZikKIAkJcmV0dXJuIHRydWU7CiAJY2FzZSBSVlZfT1BDT0RFX1ZMOgogCWNhc2UgUlZWX09Q
Q09ERV9WUzoKLQkJd2lkdGggPSBSVlZfRVhSQUNUX1ZMX1ZTX1dJRFRIKGluc25fYnVmKTsKKwkJ
d2lkdGggPSBSVlZfRVhUUkFDVF9WTF9WU19XSURUSChpbnNuX2J1Zik7CiAJCWlmICh3aWR0aCA9
PSBSVlZfVkxfVlNfV0lEVEhfOCB8fCB3aWR0aCA9PSBSVlZfVkxfVlNfV0lEVEhfMTYgfHwKIAkJ
ICAgIHdpZHRoID09IFJWVl9WTF9WU19XSURUSF8zMiB8fCB3aWR0aCA9PSBSVlZfVkxfVlNfV0lE
VEhfNjQpCiAJCQlyZXR1cm4gdHJ1ZTsKLS0gCjIuMzkuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
